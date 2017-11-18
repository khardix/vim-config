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

" === Auto-commands ===
augroup clang_cpp_settings
    " Re-setup compilation database if that changes
    autocmd! User CCompileDb call s:clang_use_database()
augroup end

" Fire CCompileDb in order to detect database for new buffer
doautocmd <nomodeline> User CCompileDb
