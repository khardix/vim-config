let NERDTreeRespectWildIgnore=1

" Close NERDTree if its last buffer left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
