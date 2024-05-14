return function()
    require("lspconfig")["yamlls"].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
            local ft = vim.bo[bufnr].filetype
            local schema = require("lib.ftschema").get_schema_for_ft(ft)
            if schema == nil then
                return
            end

            if ft == "yaml.cloudformation" or ft == "yaml.aws-sam" then
                client.config.settings.yaml.customTags = {
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
                }
            end

            client.config.settings.yaml.schemas = {
                [schema] = {"*"}
            }
        end,
        filetypes = {
            "yaml",
            "yaml.asl",
            "yaml.aws-sam",
            "yaml.cloudformation",
        },
        settings = {
            yaml = {
                completion = true,
                hover = true,
                schemaStore = {
                    -- enable = true,
                    -- url = "https://www.schemastore.org/"
                    enable = false,
                    url = "",
                },
                schemas = require('schemastore').yaml.schemas(),
            }
        }
    }
end
