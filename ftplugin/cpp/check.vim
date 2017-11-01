" Syntastic configuration
" => Expand used checkers
let g:syntastic_cpp_checkers = ['clang_tidy']
" => Use clang_complete options for checking
let g:syntastic_cpp_config_file = '.clang_complete'

" Clang-{check,tidy} extra arguments
let g:syntastic_cpp_clang_check_args = '-extra-arg=-std=c++14'
let g:syntastic_cpp_clang_tidy_args = "-extra-arg=-std=c++14 -checks='cppcoreguidelines-*,modernize-*'"
