local function get_mapper(mode, noremap)
    return function(lhs, rhs, opts)
        opts = opts or {}
        opts.noremap = noremap
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

return {
    noremap = get_mapper("n", false),
    nnoremap = get_mapper("n", true),
    inoremap = get_mapper("i", true),
    tnoremap = get_mapper("t", true),
    vnoremap = get_mapper("v", true),
}
