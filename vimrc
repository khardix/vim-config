"""ViM master configuration - by Khardix
"
" Created: 2017-09-11
"""

" General functionality
let mapleader = ',' " Start key binds with comma

set spell spelllang=en_us " Check US English spelling by default
set splitright      " Split windows to right by default

" => Load Python 3 if available
if has('python3')
elseif has('python')
endif

" Plugin management
runtime plugs.vim

" Basic look and feel
" => Escape sequences for 24-bit colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" => Use GUI colors in terminal
set termguicolors
" => Set colorscheme
colorscheme crayon
" => Set unicode fill characters
set fillchars+=vert:│
set fillchars+=fold:┄
set fillchars+=diff:═
" => Highlight status line of non-current window
highlight StatusLineNC ctermfg=fg ctermbg=bg

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
nnoremap <silent> <leader><space> :nohls<enter>

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

" Split pane movement
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
" => Create Alt-based keymaps
execute "set <M-h>=\eh <M-j>=\ej <M-k>=\ek <M-l>=\el"
" => Use Alt-based keymaps
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

" NetRW -- directory overview
let g:netrw_liststyle = 3   " Tree view
let g:netrw_sizestyle = "H" " Human-readable sizes
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles -- copied
let g:netrw_hide      = 1   " Hide files by default
let g:netrw_banner    = 0   " Do not show banner
" => Quickly open NetRW in current widow
nnoremap <silent> <leader>e :Explore!<cr>

augroup netrw
" => Wipe NetRW buffer after choosing a file
    autocmd! FileType netrw setlocal bufhidden=wipe
augroup end

" Auto-completion -- general
set completeopt=menuone,noinsert,noselect " show menu, wait for user choice
set shortmess+=c    " Disable verbose completion status messages
" => Completion keybindings -- use expression result for action
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
" => Start automatic completion on file load
let g:mucomplete#enable_auto_at_startup = 1

" Syntax checking -- general
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" => Quick jump to current error
nnoremap <silent> <leader>l :ll<cr>

" Auto-formatting -- general
let g:autoformat_autoindent = 0 " Do not re-indent
let g:autoformat_retab = 0 " Do not expand tabs
let g:autoformat_remove_trailing_spaces = 1 " Remove trailing spaces
" => Auto-format on close
augroup aformat
    autocmd! BufWrite * :Autoformat
augroup end

" Prose writing
set conceallevel=2      " Hide inline formatting markup
" => Goyo setup
function! s:goyo_enter()
    setlocal showtabline=0
    Limelight
endfunction

function! s:goyo_leave()
    Limelight!
    setlocal showtabline=1
endfunction

augroup goyo_setup
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup end
