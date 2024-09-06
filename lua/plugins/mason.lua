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
                    "hls",
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
                ["rust_analyzer"] = require("lsp.rust_analyzer"),
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
        config = function()
            require("mason").setup()
            require("mason-nvim-lint").setup {
                ensure_installed = {
                    "cfn-lint",
                    "flake8",
                    -- "sonarlint-language-server",
                },
            }

            require("lint").linters_by_ft = {
                -- python = {"flake8", "sonarlint-language-server"},
                python = { "flake8" },
                ["yaml.cloudformation"] = { "cfn_lint" },
                ["yaml.aws-sam"] = { "cfn_lint" },
            }
        end
    },
    {
        "zapling/mason-conform.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "stevearc/conform.nvim"
        },
        config = true,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("mason").setup()
            require("mason-nvim-dap").setup {
                ensure_installed = {
                    "python",
                    "codelldb",
                },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,

                    codelldb = require("dap.adapters.codelldb"),
                },
            }
        end
    }
}
