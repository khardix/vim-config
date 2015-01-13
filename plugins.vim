" Plugin configuration

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Python omnicomplete
" Automatically hide pydoc
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" clang_complete
let g:clang_complete_auto = 0 "No auto popup
let g:clang_complete_copen = 1 "clang errors in quickfix window
