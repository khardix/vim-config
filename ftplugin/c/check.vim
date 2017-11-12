" Syntastic configuration
" => Enable clang-based checkers
let g:syntastic_c_checkers = ['clang_tidy']
" => Use clang_complete options for checking
let g:syntastic_c_config_file = '.clang_complete'
" => Overwrite config file with compilation database, if present
if filereadable('compile_commands.json')
    let g:syntastic_c_clang_tidy_post_args = ""
endif
