syntax match xTab1 /^  / nextgroup=xTab2 containedin=ALL
syntax match xTab2 /  /  contained nextgroup=xTab3
syntax match xTab3 /  /  contained nextgroup=xTab4
syntax match xTab4 /  /  contained nextgroup=xTab5
syntax match xTab5 /  /  contained nextgroup=xTab6
syntax match xTab6 /  /  contained nextgroup=xTab7
syntax match xTab7 /  /  contained nextgroup=xTab2

highlight xTab1 guibg=#330000 guifg=White
highlight xTab3 guibg=#000033 guifg=White
highlight xTab5 guibg=#002200 guifg=White
highlight xTab7 guibg=#330000 guifg=White
