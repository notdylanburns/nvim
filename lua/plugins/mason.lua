return {
    {
        "williamboman/mason.nvim",
        opts = {
            pip = {
                upgrade_pip = true,
            },
            registries = {
                "github:mason-org/mason-registry",
                "file:~/asl-validator-nvim/mason-registry",
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    -- "azure_pipelines_ls",
                    "bashls",
                    "bicep",
                    "html",
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "yamlls"
                }
            }

            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                        on_attach = function() end
                    }
                end,
                ["lua_ls"] = require("lsp.lua_ls"),
                ["pyright"] = require("lsp.pyright"),
                ["yamlls"] = require("lsp.yamlls")
            }
        end
    },
    {
        "rshkarin/mason-nvim-lint",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-lint",
            "b0o/schemastore.nvim",
        },
        config = function ()
            require("mason").setup()
            require("mason-nvim-lint").setup {
                ensure_installed = {
                    "cfn-lint",
                    "flake8",
                    -- "sonarlint-language-server",
                },
                automatic_installation = false,
            }

            require("lint").linters_by_ft = {
                -- python = {"flake8", "sonarlint-language-server"},
                python = {"flake8"},
                ["yaml.cloudformation"] = {"cfn_lint"},
                ["yaml.aws-sam"] = {"cfn_lint"},
            }
        end
    }
}
