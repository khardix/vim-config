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

" === Auto-commands ===
augroup clang_c_settings
    " Re-evaluate compilation database setting on database change
    autocmd! User CCompileDb call s:clang_use_database()
augroup end

" Fire CCompileDb in order to detect database for new buffer
doautocmd <nomodeline> User CCompileDb
