" Setup and configuration for clang-based tools and plugins
" NOTE: Pure C configuration is also loaded, so this file should overwrite
" all (and only) relevant options.

" === Code completion ===
let g:clang_user_options = $CXXFLAGS  " Use environment settings
" Complete with clang on explicit Tab
let g:mucomplete#can_complete['cpp'] = g:mucomplete#can_complete['c']
let g:mucomplete#chains['cpp'] = g:mucomplete#chains['c']

" === Linting ===
let b:neomake_cpp_enabled_makers = ['clangtidy']  " Declare used checkers

" Detect compilation database and use it if possible
function! s:clangtidy_args() abort
    let l:pre_file_args = ['-checks=-*,clang-analyzer-*,cppcoreguidelines-*,modernize-*,readability-*']
    let l:database_file = khardix#clang#compilation_database()

    if l:database_file != ''
        " Use database
        let l:pre_file_args += ['-p='.fnamemodify(l:database_file, ':p:h')]
        let l:post_file_args = []
    else
        " Use environment settings
        let l:post_file_args = ['--'] + split($CXXFLAGS)
    endif

    return l:pre_file_args + ['%:p'] + l:post_file_args
endfunction
let b:neomake_cpp_clangtidy_args = funcref('s:clangtidy_args')

" === Auto-commands ===
augroup on_compile_db_change    " Shared C/C++ auto-commands
    autocmd!

    " Re-run neomake to pick up new settings
    autocmd User CCompileDb Neomake

augroup end
