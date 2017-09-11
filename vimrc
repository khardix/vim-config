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

" Searching and replacing
set gdefault        " /g on by default in substitutions
set hlsearch        " Highlight the search results
set ignorecase      " Case-insensitive search
set smartcase       " Case-sensitive search with capital letters
" => Key binding for clearing the highlight
nnoremap <leader><space> :nohls<enter>

" Swap and undo
set undofile        " Persistent undo
" => Platform-specific file path settings
if has("win32")
    set directory=$HOME\vimfiles\swap,$TEMP
    set backupdir=$HOME\vimfiles\backup,$TEMP
    set undodir=$HOME\vimfiles\undo,$TEMP
else
    set directory=~/.vim/swap,/tmp
    set backupdir=~/.vim/backup,/tmp
    set undodir=~/.vim/undo,/tmp
endif

" Tab and buffer management
set hidden          " Allow for unsaved buffers in background
set showtabline=1   " Show tabline for at least two lines
set autowrite       " Auto save on file switch
set confirm         " Ask to save instead of error on :q
" => Remap tab switching to work on buffers
nnoremap <silent> gt :bnext<cr>
nnoremap <silent> gT :bprev<cr>
nnoremap <silent> <leader>d :bdelete<cr>

" Auto-completion -- general
set completeopt=menuone,noinsert,noselect " show menu, wait for user choice
set shortmess+=c    " Disable verbose completion status messages
" => Completion keybindings -- use expression result for action
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
" => Start automatic completion on file load
let g:mucomplete#enable_auto_at_startup = 1

" Auto-formatting -- general
let g:autoformat_autoindent = 0 " Do not re-indent
let g:autoformat_retab = 0 " Do not expand tabs
let g:autoformat_remove_trailing_spaces = 1 " Remove trailing spaces
" => Auto-format on close
augroup aformat
    autocmd! BufWrite * :Autoformat
augroup end
