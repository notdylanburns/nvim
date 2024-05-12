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
                    { name = "buffer" }
                },
                {
                    { name = "cmdline" }
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
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "path" },
                    { name = "buffer" },
                },
                mapping = {
                    ["<C-Space>"] = cmp.mapping.complete(),
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
