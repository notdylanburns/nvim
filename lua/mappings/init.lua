local util = require("lib.util")

local function bufdelete(force)
    return function()
        require("bufdelete").bufdelete(0, force)
    end
end

util.nnoremap("p", "p<Cmd>%s/\\r$/<CR>") -- Strip \r when pasting
util.nnoremap("P", "P<Cmd>%s/\\r$/<CR>") -- Strip \r when pasting
util.vnoremap("p", "p<Cmd>%s/\\r$/<CR>") -- Strip \r when pasting
util.vnoremap("P", "P<Cmd>%s/\\r$/<CR>") -- Strip \r when pasting

util.nnoremap("<CR>", "o<Esc>")          -- Insert newline below
util.nnoremap("<S-CR>", "m`O<Esc>``")    -- Insert newline above

-- Create splits
util.nnoremap("<Leader>ss", util.cmd("split"))
util.nnoremap("<Leader>sv", util.cmd("vsplit"))

-- Equalise Splits
util.nnoremap("==", "<C-w>=")

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
util.nnoremap("<Leader>tv", util.cmd("vsplit", "terminal"))

-- Open new file
util.nnoremap("<Leader>ee", util.cmd("split", "enew"))
util.nnoremap("<Leader>ev", util.cmd("vsplit", "enew"))

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

-- Debug Adapter Protocol
util.nnoremap("<F5>", function() require("dap").continue() end)
util.nnoremap("<F6>", function() require("dap").terminate() end)
util.nnoremap("<F10>", function() require("dap").step_over() end)
util.nnoremap("<F11>", function() require("dap").step_into() end)
util.nnoremap("<F12>", function() require("dap").step_out() end)
util.nnoremap("<Leader>b", function() require("dap").toggle_breakpoint() end)
util.nnoremap("<Leader>B", function() require("dap").set_breakpoint() end)
util.nnoremap("<Leader>fu", function() require("dap").up() end)
util.nnoremap("<Leader>fd", function() require("dap").down() end)
util.nnoremap("<C-\\>", function() require("dap.ui.widgets").hover() end)
util.vnoremap("<C-\\>", function() require("dap.ui.widgets").hover() end)

-- Neotree
util.nnoremap("<Leader>fs", util.cmd("Neotree toggle"))

-- Copilot complete key
util.inoremap("<C-l>", [[ copilot#Accept("\\<CR>") ]], { expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true

require("mappings.aws")
require("mappings.project")
require("mappings.telescope")
