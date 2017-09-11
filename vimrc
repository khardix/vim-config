"""ViM master configuration - by Khardix
"
" Created: 2017-09-11
"""

" Plugin management
runtime plugs.vim

" General functionality
let mapleader = ',' " Start key binds with comma

set spell spelllang=en_us " Check US English spelling by default
set splitright      " Split windows to right by default

" Basic look and feel
" => Escape sequences for 24-bit colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" => Use GUI colors in terminal
set termguicolors
" => Set colorscheme
colorscheme crayon

" Line numbering
set number
set relativenumber
set numberwidth=2

" Line wrapping
set nowrap          " Do not wrap long lines
set textwidth=79    " Break line at white space after 79 characters
set colorcolumn=80  " Show ruler at the break boundary

" Indentation
set expandtab       " Use spaces instead of tabs
set tabstop=4       " Number of spaces per <Tab>
set softtabstop=4   " <BS> deletes spaces rounded to indent level
set shiftwidth=4    " Number of spaces per auto-indent level
set smarttab        " Use shiftwidth at the beginning of a line
set shiftround      " Round indentation to multiples of shiftwidth

set autoindent      " Auto-indent next lines
set cindent         " Auto-indent C intelligently
