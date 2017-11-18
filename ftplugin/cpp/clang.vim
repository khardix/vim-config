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

" === Compilation database settings ===

" Detect compilation database and use it if possible
function! s:clang_use_database() abort
    if khardix#clang#compilation_database() != ''
        " Use database
        let g:syntastic_cpp_clang_tidy_post_args = ''

    else
        " Use environment settings
        let g:syntastic_cpp_clang_tidy_post_args = ['--'] + split($CXXFLAGS)

    endif
endfunction
call s:clang_use_database()  " For new buffer

" === Auto-commands ===
augroup on_compile_db_change_cpp  " C++ specific auto-commands
    autocmd!

    " Re-evaluate compilation database setting on database change
    autocmd User CCompileDb call s:clang_use_database()

augroup on_compile_db_change    " Shared C/C++ auto-commands
    autocmd!

    " Re-run syntastic to pick up new settings
    autocmd User CCompileDb SyntasticCheck

augroup end
