"""Plugin management and configuration"""

" Find the root directory
let s:vimdir = split(&runtimepath, ',')[0]

" Install the plugin manager if it is not present
let s:plugin_manager = s:vimdir . '/autoload/plug.vim'
if empty(glob(s:plugin_manager))
    let s:install_cmd  = ['curl']
    let s:install_cmd += ['--fail', '--location', '--create-dirs']
    let s:install_cmd += ['--output', s:plugin_manager]
    let s:install_cmd += ['https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim']

    execute 'silent !' . join(s:install_cmd)

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install the plugins
call plug#begin(s:vimdir . '/plugged')

" Rock-bottom basics
Plug 'tpope/vim-sensible'       " Sensible default settings
Plug 'flazz/vim-colorschemes'   " Omnibus colorscheme support
Plug 'sheerun/vim-polyglot'     " Omnibus language support

" Auto-completion
Plug 'lifepillar/vim-mucomplete' " minimal completion engine
Plug 'davidhalter/jedi-vim'     " Python semantic completion
Plug 'rip-rip/clang_complete'   " C/C++ semantic completion

" Auto-formatting and syntax checking
Plug 'vim-syntastic/syntastic'  " Omnibus syntax checking
Plug 'Chiel92/vim-autoformat'   " Omnibus auto formatter

" UI
Plug 'ap/vim-buftabline'        " Show buffers in tabline
Plug 'christoomey/vim-tmux-navigator'  " Simplify tmux navigation

" Prose
Plug 'vim-pandoc/vim-pandoc-syntax'  " Pandoc-enhanced markdown syntax
Plug 'junegunn/goyo.vim'        " Distraction-free writing
Plug 'junegunn/limelight.vim'   " Paragraph focusing

" Miscellaneous
Plug 'tpope/vim-commentary'     " Quick commenting
Plug 'tpope/vim-repeat'         " The '.' even mightier
Plug 'tpope/vim-surround'       " Mapping for surrounding manipulation
Plug 'tpope/vim-unimpaired'     " Paired movement mappings

call plug#end()

" vim:set filetype=vim:
