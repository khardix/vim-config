"""ViM master configuration - by Khardix
"
" Created: 2017-09-11
"""

" General functionality
let mapleader = ',' " Start key binds with comma

set spell spelllang=en_us,cs " Check US English and Czech spelling
set splitright      " Split windows to right by default

" => Load Python 3 if available
if has('python3')
elseif has('python')
endif

" Plugin management
runtime plugs.vim

" Basic look and feel
if match(['screen', 'tmux', 'st', 'xterm'], $TERM)
    " => Escape sequences for 24-bit colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " => Use GUI colors in terminal
    set termguicolors
endif
" => Set colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" => Set unicode fill characters
set fillchars+=vert:│
set fillchars+=fold:┄
set fillchars+=diff:═
" => Highlight status line of non-current window
highlight StatusLineNC ctermfg=fg ctermbg=bg
" Special early syntax settings
let g:tex_flavor = 'latex'      " Use LaTeX syntax for .tex files
let g:load_doxygen_syntax = 1   " Load Doxygen syntax for supported filetypes

" Line numbering
set number
set relativenumber
set numberwidth=2

" Line wrapping
set nowrap          " Do not wrap long lines
set colorcolumn=80  " Show ruler at the break boundary

" Indentation
set expandtab       " Use spaces instead of tabs
set tabstop=4       " Number of spaces per <Tab>
set softtabstop=4   " <BS> deletes spaces rounded to indent level
set shiftwidth=4    " Number of spaces per auto-indent level
set smarttab        " Use shiftwidth at the beginning of a line
set shiftround      " Round indentation to multiples of shiftwidth

set autoindent      " Auto-indent next lines
set smartindent     " Auto-indent code intelligently

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
" => Better buffer movement
nnoremap <silent> <leader>b :bprevious<cr>
nnoremap <silent> <leader>n :bnext<cr>
" => Quickly delete a buffer
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
" => Create TMUX-compatible keymaps
nnoremap <c-e> <c-a>

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
set noinfercase     " Honor so-far typed completion case
" => Tweak default completion chains
let g:mucomplete#chains = {
    \ 'default': ['c-p', 'path', 'omni', 'ulti', 'uspl'],
    \ }
let g:mucomplete#can_complete = {}
" => Start automatic completion on file load
let g:mucomplete#enable_auto_at_startup = 1
" => Prepare dictionary for additional completion methods
" setting in ftplugin does not work :(
let g:mucomplete#user_mappings = {
\   'sqla': "\<c-c>a",
\}

" Syntax checking -- general
let g:neomake_open_list = 2
let g:neomake_list_height = 5
call neomake#configure#automake('rw')
" => Quick jump to current error
nnoremap <silent> <leader>l :ll<cr>
" => Disable checking in read-only buffers
augroup syntax_checking
    function! SetCheckingMode() abort
        if &readonly
            NeomakeDisableBuffer
        else
            NeomakeEnableBuffer
        endif
    endfunction

    autocmd!
    autocmd BufEnter * call SetCheckingMode()
augroup end


" Auto-formatting -- general
let g:autoformat_autoindent = 0 " Do not re-indent
let g:autoformat_retab = 0 " Do not expand tabs
let g:autoformat_remove_trailing_spaces = 1 " Remove trailing spaces
" => Auto-format on close
augroup aformat
    autocmd! BufWrite * :Autoformat
augroup end
command DisableAutoformat augroup aformat | autocmd! | augroup end

" Code snippets
" => Change default keybindings to work in tmux
let g:UltiSnipsExpandTrigger        = "<c-t>"
let g:UltiSnipsJumpForwardTrigger   = "<c-t>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-y>"
" => Use low case directory name
let g:UltiSnipsSnippetDirectories = ['ulti-snips', 'UltiSnips']

" Prose writing
set conceallevel=2      " Hide inline formatting markup
set list listchars=nbsp:~,tab:╞═,extends:⇉,precedes:⇇  " Show special characters

" => Markdown syntax
augroup pandoc_syntax
    autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    autocmd! BufNewFile,BufFilePre,BufRead *.mkd set filetype=markdown.pandoc
    autocmd! BufNewFile,BufFilePre,BufRead *.markdown set filetype=markdown.pandoc
augroup end

let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = [
    \ 'python', 'vim', 'make', 'bash=sh',
    \ 'html', 'css', 'scss', 'javascript',
    \ ]

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

" => Email composition
let g:qcc_query_command = system('neomutt -Q query_command 2>/dev/null')
let g:qcc_query_command = substitute(g:qcc_query_command, '^query_command="\(.*\)"\n', '\1','')
let g:qcc_multiline = 1
let g:qcc_multiline_pattern = '^\s' " only look for header if the line starts with whitespace
augroup email
    autocmd FileType mail setlocal omnifunc=QueryCommandComplete
augroup end

" Automation of boring formatting
" => Switch between one-line and multi-line function call
let g:argwrap_tail_comma = 1
nnoremap <silent> <leader>a :ArgWrap<cr>

" Per-project configuration
" => Enable loading per-directory .vimrc
" => Secure disables some features, keep at the end of main .vimrc
set secure exrc
