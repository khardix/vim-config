" Setup and configuration of clang-based tools and plugins

" === Basics ===
let g:clang_library_path = '/usr/lib64'  " Path to clang library .so
let g:clang_snippets_engine = 'ultisnips'

" === Code completion ===
let g:clang_user_options = $CFLAGS  " Use environment settings
" Only use clang if explicitly requested
let g:clang_complete_auto = 0
let g:mucomplete#can_complete['c'] = {
    \ 'omni': {t -> g:mucomplete_with_key},
    \ 'incl': {t -> g:mucomplete_with_key},
    \ }
let g:mucomplete#chains['c'] = ["c-p", 'keyp', 'uspl', 'omni', 'path', 'tags', 'incl']
" Utilize compilation database for code completion, if possible
let g:clang_auto_user_options = '.clang_complete, compile_commands.json, path'
" Complete arguments and template parameters
let g:clang_snippets = 1
let g:clang_complete_optional_args_in_snippets = 1

" If found (and only if found), point the clang_complete to the database directory
let s:clang_compilation_database = khardix#clang#compilation_database()
if s:clang_compilation_database != ''
    let g:clang_compilation_database = fnamemodify(s:clang_compilation_database, ':p:h')
endif

" === Linting ===
let b:neomake_c_enabled_makers = ['clangtidy']  " Turn on desired checkers

" === Compilation database settings ===

" Detect compilation database and use it if possible
function! s:clangtidy_args() abort
    let l:database_file = khardix#clang#compilation_database()

    if l:database_file != ''
        " Use the database
        let l:pre_args = ['-p='.fnamemodify(l:database_file, ':p:h')]
        let l:post_args = []
    else
        " Use environment settings for the default flags
        let l:pre_args = []
        let l:post_args = ['--'] + split($CFLAGS)
    endif

    return l:pre_args + ['%:p'] + l:post_args
endfunction
let b:neomake_c_clangtidy_args = funcref('s:clangtidy_args')

" === Auto-commands ===
augroup on_compile_db_change    " Shared C/C++ auto-commands
    autocmd!

    " Re-run neomake to pick up new settings
    autocmd User CCompileDb Neomake

augroup end
