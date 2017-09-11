"""ViM master configuration - by Khardix
"
" Created: 2017-09-11
"""

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
