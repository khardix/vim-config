" VIM file types configuration

let g:tex_flavor = "latex"

autocmd FileType html,xhtml,xml,phtml,latte let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,phtml,latte source ~/.vim/bundle/closetag/plugin/closetag.vim
