" Vundle settings

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle - required
Bundle 'gmarik/vundle'

" ===== My bundles =====
" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/dante.vim'

" IDE
Bundle 'scrooloose/nerdtree'

" Syntax highlight
Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'

" Misc
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/bufkill.vim'
