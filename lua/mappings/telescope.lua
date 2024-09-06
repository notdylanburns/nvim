local util = require("lib.util")

util.nnoremap("<Leader>fb", function() require("telescope.builtin").buffers {} end)
util.nnoremap("<Leader>ff", function() require("telescope.builtin").find_files {} end)
util.nnoremap("<Leader>fg", function() require("telescope.builtin").git_files {} end)
util.nnoremap("<Leader>ld", function() require("telescope.builtin").lsp_document_symbols {} end)
util.nnoremap("<Leader>lw", function() require("telescope.builtin").lsp_dynamic_workspace_symbols {} end)
