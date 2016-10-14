" Flake* plugin configuration

let g:flake8_cmd="/usr/bin/python3-flake8"

let g:flake8_quickfix_location="top"

let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=0
let g:flake8_show_in_file=1

" Run flake8 everytime Python file is saved
autocmd BufWritePost *.py call Flake8()
