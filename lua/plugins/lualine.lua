local aws = require("lib.aws")

local function show_aws_status()
    return aws.get_profile() ~= nil
end

local function is_expired()
    return aws.get_credential_timout() == "EXP"
end

local function get_aws_style()
    if is_expired() then
        return {
            bg = "#ff5050"
        }
    else
        return nil
    end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_b = {"diff", "diagnostics", "filename"},
                lualine_c = {
                    "branch",
                    {
                        aws.get_profile,
                        cond = show_aws_status,
                        separator = "",
                        color = get_aws_style,
                    },
                    {
                        aws.get_credential_timout,
                        cond = show_aws_status,
                        color = get_aws_style,
                    },
                }
            }
        })
    end
}
