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
Bundle 'ervandew/supertab'
Bundle 'spf13/PIV'

" Syntax highlight
"Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'peterhoeg/vim-qml'

" Omnicomplete
Bundle 'vim-scripts/pythoncomplete'

" Misc
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'tpope/vim-surround'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/bufkill.vim'
