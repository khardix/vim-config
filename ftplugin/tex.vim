" Use 2-space indents
set tabstop=2 softtabstop=2 shiftwidth=2
" Auto-continue comment lines
set formatoptions+=croq

" Disable linting (lots of false positives in class/package files
let g:neomake_tex_enabled_makers = []
