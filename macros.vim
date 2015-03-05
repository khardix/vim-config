" VIM macro definitions
let mapleader = ","
let maplocalleader = ","

nnoremap <localleader>id "=strftime("%a %e. %B %Y")<CR>P
inoremap <localleader>id <C-R>"=strftime("%a %e. %B %Y")<CR>

" Czech quotes - opening and closing
inoremap <localleader>,, <C-V>u201e
inoremap <localleader>"  <C-V>u201c

" Highlight current column and line in normal mode
augroup CursorLine
  au!
  au VimEnter,WinEnter,InsertLeave,BufWinEnter * setlocal cursorline cursorcolumn
  au InsertEnter,WinLeave * setlocal nocursorline nocursorcolumn
augroup END
