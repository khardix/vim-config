" Syntastic configuration
" => Enable clang-based checkers
let g:syntastic_c_checkers = ['clang_tidy']
" => Use clang_complete options for checking
let g:syntastic_c_config_file = '.clang_complete'

" Clang-check options
let g:syntastic_c_clang_check_args = '-extra-arg=-std=c11'
let g:syntastic_c_clang_tidy_args = '-extra-arg=-std=c11'
