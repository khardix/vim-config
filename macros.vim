" VIM macro definitions
let mapleader = ","
let maplocalleader = ","

" Locale (czech) date
nnoremap <localleader>id "=strftime("%a %e. %B %Y")<CR>P
inoremap <localleader>id <C-R>=strftime("%a %e. %B %Y")<CR>

" International datetime
nnoremap <localleader>iid "=strftime("%Y-%m-%d %H:%M %Z")<CR>P
inoremap <localleader>iid <C-R>=strftime("%Y-%m-%d %H:%M %Z")<CR>

" Czech quotes - opening and closing
inoremap <localleader>,, <C-V>u201e
inoremap <localleader>"  <C-V>u201c

" Highlight current column and line in normal mode
augroup CursorLine
  au!
  au VimEnter,WinEnter,InsertLeave,BufWinEnter * setlocal cursorline cursorcolumn
  au InsertEnter,WinLeave * setlocal nocursorline nocursorcolumn
augroup END
