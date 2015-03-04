" Custom keybinds and remaps
" Use leader mapping from macros.vim

" ===== Tabs/buffers handling =====
" Use buffers rather than tabs
nmap gt :bnext<CR>
nmap gT :bprev<CR>

" ===== IDE functions ====
nnoremap <LocalLeader>n :NERDTreeToggle<CR>
nnoremap <LocalLeader>t :TagbarToggle<CR>
