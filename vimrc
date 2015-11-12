" khardix's vim config file
" updated to using vundle

set nocompatible

" === Vundle setup ===
filetype off
source ~/.vim/bundles.vim

filetype plugin indent on

" === Look ===
set ruler " Show cursor position
set showmode " Show current mode
set showcmd
syntax on " Highlight syntax
set number " Turn on line numbering
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" === Line wrapping ===
set nowrap
set linebreak
set showbreak=+
set colorcolumn=81

" === Word completions ===
"set wildchar=<Tab> " Complete on tab
"set wildmenu " Show menu
"set wildmode=longest:full,full " Fill in the longest common part
" ^ deprecated in favor of supertab/omnicomplete
set completeopt=menu,menuone,longest " disable preview window
set pumheight=15 "Limit popup menu height

" === Movement ===
noremap <Up> g<Up>
noremap <Down> g<Down>
inoremap <Up> <Esc>g<Up>a
inoremap <Down> <Esc>g<Down>a

" === Editation ===
set backspace=2
set showmatch
set nojoinspaces

" === Indentation ===
set autoindent
set cindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set shiftround
set expandtab

" === Saving ===
set autowrite
set backup
set backupdir=~/.vim/backup/,.,~/
set directory=~/.vim/temp/,/var/tmp/,. " Temporary files
set viewdir=~/.vim/views/
set confirm
set hidden

" === Clipboard ===
set clipboard^=unnamed
set pastetoggle=<F11> " Toggle nice text pasting from outside vim

" === Folding ===
set foldmethod=marker

" === Macros ===
source ~/.vim/macros.vim

" === Filetype config ===
source ~/.vim/ftypes.vim

" === Custom keybindings ===
source ~/.vim/keybinds.vim
