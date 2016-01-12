" VIM file types configuration

let g:tex_flavor = "latex"

autocmd FileType html,xhtml,xml,phtml,latte let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,phtml,latte source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

autocmd FileType html,xhtml,xml,phtml,latte set autoindent
autocmd FileType html,xhtml,xml,phtml,latte set smartindent

" Python help
au FileType python,python3 setlocal keywordprg=pydoc3

" C/C++ help
au FileType c,cpp,h,hpp setlocal keywordprg=cppman

" Tables in markdown
au FileType markdown let g:table_mode_corner="|"
