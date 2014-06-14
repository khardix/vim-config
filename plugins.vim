" Plugin configuration

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Python omnicomplete
" Automatically hide pydoc
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
