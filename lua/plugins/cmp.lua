local lspkind_comparator = function(conf)
    local lsp_types = require('cmp.types').lsp
    return function(entry1, entry2)
        if entry1.source.name ~= 'nvim_lsp' then
            if entry2.source.name == 'nvim_lsp' then
                return false
            else
                return nil
            end
        end
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then
            return nil
        end
        return priority2 < priority1
    end
end

local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label < entry2.completion_item.label
end

local function config(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    cmp.setup.cmdline(
        {"/", "?"},
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        }
    )

    cmp.setup.cmdline(
        ":",
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    { name = "cmdline" }
                },
                {
                    { name = "buffer" }
                }
            ),
            matching = { disallow_symbol_nonprefix_matching = false }
        }
    )
end

return {
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            "lukas-reineke/cmp-under-comparator",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = function()
            local cmp = require("cmp")

            return {
                preselect = cmp.PreselectMode.None,
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    documentation = cmp.config.window.bordered {
                        border = {
                            "┌", "─", "┐", "│", "┘", "─", "└", "│",
                        }
                    },
                },
                sorting = {
                    comparators = {
                        lspkind_comparator({
                            kind_priority = {
                                Field = 11,
                                Property = 11,
                                Constant = 10,
                                Enum = 10,
                                EnumMember = 10,
                                Event = 10,
                                Function = 10,
                                Method = 10,
                                Operator = 10,
                                Reference = 10,
                                Struct = 10,
                                Variable = 9,
                                File = 8,
                                Folder = 8,
                                Class = 5,
                                Color = 5,
                                Module = 5,
                                Keyword = 2,
                                Constructor = 1,
                                Interface = 1,
                                Snippet = 1,
                                Text = 1,
                                TypeParameter = 1,
                                Unit = 1,
                                Value = 1,
                            },
                        }),
                        require("cmp-under-comparator").under,
                        label_comparator,
                    }
                },
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "path" },
                    { name = "buffer" },
                },
                mapping = {
                    ["<C-\\>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ["<Tab>"] = cmp.mapping.select_next_item { cmp.SelectBehavior.Select },
                    ["<S-Tab>"] = cmp.mapping.select_prev_item { cmp.SelectBehavior.Select },
                },

            }
        end,
        config = config
    }
}
