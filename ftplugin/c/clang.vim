" Setup and configuration of clang-based tools and plugins

" === Basics ===
let g:clang_library_path = '/usr/lib64'  " Path to clang library .so

" === Code completion ===
let g:clang_user_options = $CFLAGS  " Use environment settings
" Utilize compilation database for code completion, if possible
let g:clang_auto_user_options = '.clang_complete, compile_commands.json, path'

" === Linting ===
let g:syntastic_c_checkers = ['clang_tidy']  " Turn on desired checkers

" === Compilation database settings ===

" Detect compilation database and use it if possible
function! s:clang_use_database() abort
    if khardix#clang#compilation_database() != ''
        " Use the database
        let g:syntastic_c_clang_tidy_post_args = ''
    else
        " Use environment settings for the default flags
        let g:syntastic_c_clang_tidy_post_args = ['--'] + split($CFLAGS)
    endif
endfunction
call s:clang_use_database()  " For new buffer

" === Auto-commands ===
augroup on_compile_db_change_c  " Pure C specific auto-commands
    autocmd!

    " Re-evaluate compilation database setting on database change
    autocmd User CCompileDb call s:clang_use_database()

augroup on_compile_db_change    " Shared C/C++ auto-commands
    autocmd!

    " Re-run syntastic to pick up new settings
    autocmd User CCompileDb SyntasticCheck

augroup end
