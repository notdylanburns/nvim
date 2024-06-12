return {
    "lewis6991/gitsigns.nvim",
    config = {
        current_line_blame = true,
    },
    on_attach = function()
        local gitsigns = require("gitsigns")
        local util = require("lib.util")

        -- Navigation
        util.nnoremap("]c", function()
            if vim.wo.diff then
                vim.cmd.normal({"]c", bang = true})
            else
                gitsigns.nav_hunk("next")
            end

        end)

        util.nnoremap("[c", function()
            if vim.wo.diff then
                vim.cmd.normal({"[c", bang = true})
            else
                gitsigns.nav_hunk("prev")
            end

        end)

        -- Actions
        util.nnoremap("<leader>hs", gitsigns.stage_hunk)

        util.nnoremap("<leader>hr", gitsigns.reset_hunk)
        util.vnoremap("<leader>hs", function() gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        util.vnoremap("<leader>hr", function() gitsigns.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        util.nnoremap("<leader>hS", gitsigns.stage_buffer)
        util.nnoremap("<leader>hu", gitsigns.undo_stage_hunk)
        util.nnoremap("<leader>hR", gitsigns.reset_buffer)
        util.nnoremap("<leader>hp", gitsigns.preview_hunk)
        util.nnoremap("<leader>hb", function() gitsigns.blame_line{full=true} end)
        util.nnoremap("<leader>tb", gitsigns.toggle_current_line_blame)
        util.nnoremap("<leader>hd", gitsigns.diffthis)

        util.nnoremap("<leader>hD", function() gitsigns.diffthis("~") end)
        util.nnoremap("<leader>td", gitsigns.toggle_deleted)
    end
}
