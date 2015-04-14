" Custom keybinds and remaps
" Use leader mapping from macros.vim

" ===== Tabs/buffers handling =====
" Use buffers rather than tabs
nmap gt :bnext<CR>
nmap gT :bprev<CR>

" ===== IDE functions ====
nnoremap <LocalLeader>n :NERDTreeToggle<CR>
nnoremap <LocalLeader>t :TagbarToggle<CR>

nnoremap <LocalLeader>sc :syntasticCheck<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

nnoremap <F9> :make<CR>
nnoremap ]c :cnext<CR>
nnoremap [c :cprev<CR>
nnoremap <LocalLeader>l :clist<CR>

" Window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap keys fo better functionality under tmux
nnoremap <C-e> <C-a>
