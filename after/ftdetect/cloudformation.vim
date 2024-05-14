function! s:IsYamlCloudformation()
    return search('AWSTemplateFormatVersion:', 'nw')
endfunction

function! s:IsYamlSAM()
    return s:IsYamlCloudformation() && search('AWS::Serverless-2016-10-31', 'nw')
endfunction

function! s:IsJsonCloudformation()
    return search('"AWSTemplateFormatVersion":', 'nw')
endfunction

function! s:IsJsonSAM()
    return s:IsJsonCloudformation() && search('"AWS::Serverless-2016-10-31"', 'nw')
endfunction

function! s:FtDetectYaml()
    if s:IsYamlSAM()
        setlocal ft=yaml.aws-sam
    elseif s:IsYamlCloudformation()
        setlocal ft=yaml.cloudformation
    endif
endfunction

function! s:FtDetectJson()
    if s:IsJsonSAM()
        setlocal ft=json.aws-sam
    elseif s:IsJsonCloudformation()
        setlocal ft=json.cloudformation
    endif
endfunction

au BufRead,BufNewFile *.yml,*.yaml :call s:FtDetectYaml()
au BufRead,BufNewFile *.json :call s:FtDetectJson()
