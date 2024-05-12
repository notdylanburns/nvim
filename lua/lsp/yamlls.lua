return function()
    require("lspconfig")["yamlls"].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function() end,
        settings = {
            yaml = {
                customTags = {
                    "!And",
                    "!And sequence",
                    "!If",
                    "!If sequence",
                    "!Not",
                    "!Not sequence",
                    "!Equals",
                    "!Equals sequence",
                    "!Or",
                    "!Or sequence",
                    "!FindInMap",
                    "!FindInMap sequence",
                    "!Base64",
                    "!Join",
                    "!Join sequence",
                    "!Cidr",
                    "!Ref",
                    "!Sub",
                    "!Sub sequence",
                    "!GetAtt",
                    "!GetAZs",
                    "!ImportValue",
                    "!ImportValue sequence",
                    "!Select",
                    "!Select sequence",
                    "!Split",
                    "!Split sequence"
                },
                schemaStore = {
                    enable = true,
                    url = "https://www.schemastore.org/"
                }
            }
        }
    }
end
