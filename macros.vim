" VIM macro definitions
let mapleader = ","
let maplocalleader = ","

map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
map <C-q> :BD<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <localleader>id "=strftime("%a %e. %B %Y")<CR>P
inoremap <localleader>id <C-R>"=strftime("%a %e. %B %Y")<CR>

" Czech quotes - opening and closing
inoremap <localleader>,, <C-V>u201e
inoremap <localleader>"  <C-V>u201c
