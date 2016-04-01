" ===== YouCompleteMe configuration variables =====

" Path to fallback config for C-family languages
let g:ycm_global_ycm_extra_conf = '~/.vim/plugin/ycm_extra_conf.py'
" Do not ask for extra config files
let g:ycm_confirm_extra_conf = 0

" Show diagnostics
let g:ycm_always_populate_location_list = 1

" Custom error and warning symbols
let g:ycm_warning_symbol = '‼'
let g:ycm_error_symbol   = '⁇'

" Use python3 completion
let g:ycm_python_binary_path = '/usr/bin/python3'
