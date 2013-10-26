" khardix's vim config file
" updated to using vundle

set nocompatible

" === Vundle setup ===
filetype off
source ~/.vim/bundles.vim

filetype plugin indent on

" === Look ===
colorscheme dante
set ruler " Show cursor position
set showmode " Show current mode
set showcmd
syntax on " Highlight syntax
set number " Turn on line numbering

" === Line wrapping ===
set nowrap
set linebreak
set showbreak=+
set colorcolumn=81

" === Word completions ===
set wildchar=<Tab> " Complete on tab
set wildmenu " Show menu
set wildmode=longest:full,full " Fill in the longest common part

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
set smartindent
set shiftwidth=2
set shiftround
set tabstop=2
set expandtab

" === Saving ===
set autowrite
set backup
set backupdir=~/.vim/backup/,.,~/
set directory=~/.vim/temp/,/var/tmp/,. " Temporary files
set confirm

" === Clipboard ===
set clipboard=unnamed

" === Macros ===
source ~/.vim/macros.vim

" === Filetype config ===
source ~/.vim/ftypes.vim

" === Plugin config ===
source ~/.vim/plugins.vim
