return function()
    require("lspconfig")["rust_analyzer"].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function() end,
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = true,
                },
                inlayHints = {
                    chainingHints = true,
                    parameterHints = true,
                    typeHints = true
                }
            }
        }
    }
end
