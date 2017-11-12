" Syntastic configuration
" => Expand used checkers
let g:syntastic_cpp_checkers = ['clang_tidy']
" => Use clang_complete options for checking
let g:syntastic_cpp_config_file = '.clang_complete'
if filereadable('compile_commands.json')
    let g:syntastic_cpp_clang_tidy_post_args = ""
endif

" Clang-{check,tidy} extra arguments
let g:syntastic_cpp_clang_tidy_args = "-checks='cppcoreguidelines-*,modernize-*'"
