" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '»'

let g:syntastic_cpp_checkers = ['clang_check', 'gcc']
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_cpp_clang_check_args = g:syntastic_cpp_compiler_options
let g:syntastic_cpp_check_header = 1

let g:syntastic_c_checkers = g:syntastic_cpp_checkers
let g:syntastic_c_check_header = g:syntastic_cpp_check_header
