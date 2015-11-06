" VIM file types configuration

let g:tex_flavor = "latex"

autocmd FileType html,xhtml,xml,phtml,latte let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,phtml,latte source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

autocmd FileType html,xhtml,xml,phtml,latte set autoindent
autocmd FileType html,xhtml,xml,phtml,latte set smartindent

" Python colorscheme
au FileType python,python3 colorscheme jellybeans

" Tables in markdown
au FileType markdown let g:table_mode_corner="|"
