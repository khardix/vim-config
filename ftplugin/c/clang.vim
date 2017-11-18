" Setup and configuration of clang-based tools and plugins

" === Basics ===
let g:clang_library_path = '/usr/lib64'  " Path to clang library .so

" === Code completion ===
let g:clang_user_options = $CFLAGS  " Use environment settings

" === Linting ===
let g:syntastic_c_checkers = ['clang_tidy']  " Turn on desired checkers

" => clang-tidy
" Use environment settings for the default flags
let g:syntastic_c_clang_tidy_post_args = ['--'] + split($CFLAGS)
