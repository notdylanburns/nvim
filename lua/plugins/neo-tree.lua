local function setup()
    require("neo-tree").setup({
        close_if_last_window = false,
        enable_git_status = true,
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
                never_show = {},
            },
            hijack_netrw_behaviour = "open_current",
        },
        window = {
            -- position = "current",
            mappings = {
                ["h"] = function(state) end,
                ["Y"] = function(state)
                    vim.fn.setreg('"', state.tree:get_node():get_id())
                end
            }
        }
    })
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    init = function()
        if vim.fn.argc(-1) == 1 then
            local stat = (vim.uv or vim.loop).fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                setup()
            end
        end
    end,
    config = function()
        setup()
    end,
}
