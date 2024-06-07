return function()
    require("lspconfig")["pyright"].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function() end,
        settings = {
            python = {
                analysis = {
                    useLibraryCodeForTypes = true,
                    diagnosticSeverityOverrides = {
                        reportTypedDictNotRequiredAccess = "none"
                    },
                    typeCheckingMode = "basic"
                }
            }
        }
    }
end
