local util = require("lib.util")

util.nnoremap("<M-d>", "<Cmd>BufferClose<CR>")
util.nnoremap("<M-S-d>", "<Cmd>BufferRestore<CR>")
util.nnoremap("<M-d><M-d>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>")
util.nnoremap("<M-,>", "<Cmd>BufferPrevious<CR>")
util.nnoremap("<M-.>", "<Cmd>BufferNext<CR>")
util.nnoremap("<M-<>", "<Cmd>BufferMovePrevious<CR>")
util.nnoremap("<M->>", "<Cmd>BufferMoveNext<CR>")

return {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        clickable = true,
        exclude_ft = {"neo-tree"},
        focus_on_close = "previous",
    },
    version = "^1.0.0",
}
