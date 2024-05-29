local o = vim.opt

o.autoindent = true
o.autowrite = true
o.background = "dark"
o.clipboard = "unnamedplus"
o.cursorline = true
o.encoding = "UTF-8"
o.equalalways = true
o.expandtab = true
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldmethod = "manual"
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.inccommand = "split"
o.incsearch = true
o.laststatus = 3
o.list = true
o.listchars = {}
o.mouse = "a"
o.number = true
o.pumheight = 10
o.re = 0
o.relativenumber = true
o.scrolloff = 2
o.shell = "/usr/bin/bash"
o.shiftwidth = 4
o.showmatch = true
o.sidescroll = 2
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.softtabstop = 4
o.splitbelow = true
o.splitkeep = "screen"
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 250
o.title = true
o.ttyfast = true
o.undofile = true
o.updatetime = 250
o.wildmenu = true
o.wrap = false

o.completeopt = {
    menu = true,
    menuone = true,
    noinsert = true,
    noselect = true,
}

o.listchars = {
    tab = "» ",
}

o.whichwrap:append {
    ["<"] = true,
    [">"] = true,
    h = true,
    l = true,
    ["["] = true,
    ["]"] = true
}

o.wildmode = {
    longest = true,
    list = true,
    full = true,
}

vim.g.do_filetype_lua = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[
    filetype plugin on
    syntax on
]]
