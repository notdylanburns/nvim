vim.cmd [[
    function! s:StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun

    augroup file_save
        autocmd!
        autocmd BufWritePre * :call s:StripTrailingWhitespaces()
    augroup END
]]

local autocmds = {
    lint = {
        {"BufRead,BufWritePost,InsertLeave", "*", [[ :lua require("lint").try_lint() ]]},
    },
    terminal_job = {
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
    },
}

for group_name, definition in pairs(autocmds) do
    vim.api.nvim_command('augroup '..group_name)

    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
        local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
        vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
end
