return function()
    require("lspconfig")["lua_ls"].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function() end,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {"vim"}
                }
            }
        }
    }
end
