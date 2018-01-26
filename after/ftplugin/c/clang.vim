" Setup and configuration of clang-based tools and plugins

" === Basics ===
let g:clang_library_path = '/usr/lib64'  " Path to clang library .so

" === Code completion ===
let g:clang_user_options = $CFLAGS  " Use environment settings
" Utilize compilation database for code completion, if possible
let g:clang_auto_user_options = '.clang_complete, compile_commands.json, path'

" === Linting ===
let b:neomake_c_enabled_makers = ['clangtidy']  " Turn on desired checkers

" === Compilation database settings ===

" Detect compilation database and use it if possible
function! s:clangtidy_args() abort
    if khardix#clang#compilation_database() != ''
        " Use the database
        let l:post_args = []
    else
        " Use environment settings for the default flags
        let l:post_args = ['--'] + split($CFLAGS)
    endif

    return ['%:p'] + l:post_args
endfunction
let b:neomake_c_clangtidy_args = funcref('s:clangtidy_args')

" === Auto-commands ===
augroup on_compile_db_change    " Shared C/C++ auto-commands
    autocmd!

    " Re-run neomake to pick up new settings
    autocmd User CCompileDb Neomake

augroup end
