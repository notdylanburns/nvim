function! s:ftDetectYaml()
    if search('States:', 'nw') && search('StartAt:', 'nw')
        setlocal ft=yaml.asl
    endif
endfunction

function! s:ftDetectJson()
    if search('"States":', 'nw') && search('"StartAt":', 'nw')
        setlocal ft=json.aws-sam
    endif
endfunction

au BufRead,BufNewFile *.yml,*.yaml :call s:ftDetectYaml()
au BufRead,BufNewFile *.json :call s:ftDetectJson()
