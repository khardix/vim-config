" Set vim to be PEP8 compliant

" Tabs and spaces
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

" File width
setlocal textwidth=72 " Used only in long comments
setlocal colorcolumn=80

" Do not indent extra shiftwidth in open parens
let g:pyindent_open_paren = '&sw'
let g:pyindent_continue = '&sw'
