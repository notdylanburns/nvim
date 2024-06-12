local util = require("lib.util")

local function bufdelete(force)
    return function()
        require("bufdelete").bufdelete(0, force)
    end
end

util.nnoremap("p", "p<Cmd>%s/\\r$/<CR>")    -- Strip \r when pasting
util.nnoremap("P", "P<Cmd>%s/\\r$/<CR>")    -- Strip \r when pasting
util.vnoremap("p", "p<Cmd>%s/\\r$/<CR>")    -- Strip \r when pasting
util.vnoremap("P", "P<Cmd>%s/\\r$/<CR>")    -- Strip \r when pasting

util.nnoremap("<CR>", "o<Esc>")             -- Insert newline below
util.nnoremap("<S-CR>", "m`O<Esc>``")       -- Insert newline above

-- Create splits
util.nnoremap("<Leader>ss", util.cmd("split"))
util.nnoremap("<Leader>vs", util.cmd("vsplit"))

-- Move between splits
util.nnoremap("<C-h>", "<C-w>h")
util.nnoremap("<C-j>", "<C-w>j")
util.nnoremap("<C-k>", "<C-w>k")
util.nnoremap("<C-l>", "<C-w>l")

-- Resize splits
util.nnoremap("<A-h>", "<C-w><lt>")
util.nnoremap("<A-j>", "<C-w>+")
util.nnoremap("<A-k>", "<C-w>-")
util.nnoremap("<A-l>", "<C-w>>")

-- Move splits
util.nnoremap("<A-S-h>", "<C-w>H")
util.nnoremap("<A-S-j>", "<C-w>J")
util.nnoremap("<A-S-k>", "<C-w>K")
util.nnoremap("<A-S-l>", "<C-w>L")

-- Switch buffers
util.nnoremap("<A-,>", util.cmd("bp"))
util.nnoremap("<A-.>", util.cmd("bn"))

-- Close buffers (leaving splits intact)
util.nnoremap("<A-d>", bufdelete(true))

-- Open terminal
util.nnoremap("<C-'>", util.cmd("terminal"))
util.nnoremap("<Leader>tt", util.cmd("split", "terminal"))
util.nnoremap("<Leader>tr", util.cmd("vsplit", "terminal"))

--[[
nnoremap(
    "<C-\\>",
    function()
        local current_file = vim.fn.getreg("%")
        local stat = (vim.uv or vim.loop).fs_stat(current_file)
        if not stat then
            vim.notify("Invalid file: '" .. current_file .. "'")
            return
        end

        local parent_dir = vim.fs.dirname(current_file)

        vim.cmd("call termopen('cd '" .. parent_dir .. ")")
    end
)
--]]

-- Terminal Escape
util.tnoremap("<Esc>", "<C-\\><C-n>")

-- Tab selected blocks
util.nnoremap("<Tab>", "<S->><S->>")
util.nnoremap("<S-Tab>", "<S-<><S-<>")
util.vnoremap("<Tab>", ">gv")
util.vnoremap("<S-Tab>", "<gv")

require("mappings.aws")
require("mappings.telescope")
