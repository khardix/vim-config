"""Python-specific ViM settings"""

" Use python 3 for completion
augroup python3
    autocmd! BufEnter *.py setlocal omnifunc=python3complete#Complete
augroup end

" Auto-completion -- use jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:mucomplete#chains['python'] = ['omni', 'c-p', 'path', 'ulti', 'uspl']

" Syntax checking -- use python 3
let b:neomake_python_enabled_makers = ['python', 'flake8']
let b:neomake_python_python_exe = 'python3'

" Autoformat -- use black
let b:formatdef_black = '"black --quiet -"'
let b:formatters_python = ['black']
