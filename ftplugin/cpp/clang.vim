" Setup and configuration for clang-based tools and plugins
" NOTE: Pure C configuration is also loaded, so this file should overwrite
" all (and only) relevant options.

" === Code completion ===
let g:clang_user_options = $CXXFLAGS  " Use environment settings

" === Linting ===
let g:syntastic_cpp_checkers = ['clang_tidy']  " Declare used checkers

" => clang-tidy
" Tweak used checks - only static analyzer, core guidelines, modernize and readability
let g:syntastic_cpp_clang_tidy_args = [
\    '-checks=-*,clang-analyzer-*,cppcoreguidelines-*,modernize-*,readability-*',
\]
" Use environment-defined flags
let g:syntastic_cpp_clang_tidy_post_args = ['--'] + split($CXXFLAGS)
