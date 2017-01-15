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
" C/C++ extra syntax
au FileType c,h setlocal filetype=c.doxygen
au FileType cpp,hpp setlocal filetype=cpp.doxygen

" Tables in markdown
au FileType markdown let g:table_mode_corner="|"

" Extra markdown extensions
autocmd! BufRead,BufNewFile *.text  set filetype=markdown

" Whitespace nuking in certain filetypes
autocmd FileType c,cpp,python,python3 autocmd BufWritePre * :%s/\s\+$//e

" Automatic spellcheck in code
autocmd FileType gitcommit,c,cpp,python,python3 set spelllang=en spell
