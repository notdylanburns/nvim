local M = {}

local function get_mapper(mode, noremap)
    return function(lhs, rhs, opts)
        opts = opts or {}
        opts.noremap = noremap
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

M.noremap = get_mapper("n", false)
M.nnoremap = get_mapper("n", true)
M.inoremap = get_mapper("i", true)
M.tnoremap = get_mapper("t", true)
M.vnoremap = get_mapper("v", true)

function M.get_char()
    return vim.fn.strcharpart(
        vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.') - 1),
        0,
        1
    )
end

return M
