return function()
    require("lspconfig")["azure_pipelines_ls"].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function() end,
        settings = {
            yaml = {
                schemas = {
                    ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                        "ci/azure-pipelines*.yml",
                        "ci/azure-pipelines*.yaml",
                        "ci/pipelines*.yml",
                        "ci/pipelines*.yaml",
                        "azure-pipelines*.yml",
                        "azure-pipelines*.yaml",
                        "pipelines*.yml",
                        "pipelines*.yaml",
                    }
                }
            }
        }
    }
end
