" Vundle settings

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle - required
Plugin 'gmarik/Vundle.vim'

" ===== My bundles =====
" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/dante.vim'
Plugin 'nanotech/jellybeans.vim'

" IDE
Plugin 'scrooloose/nerdtree'
Plugin 'spf13/PIV'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dispatch'

" Syntax highlight
Plugin 'hdima/python-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'peterhoeg/vim-qml'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'vitaly/vim-literate-coffeescript'
Plugin 'derekwyatt/vim-scala'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tikhomirov/vim-glsl'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'wting/rust.vim'

" Completion and syntax checking
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'artur-shaik/vim-javacomplete2'

" Prose/text editing
Plugin 'mmai/wikilink'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'lervag/vimtex'

" Misc
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ap/vim-buftabline'
Plugin 'tpope/vim-eunuch'

" Ending
call vundle#end()
