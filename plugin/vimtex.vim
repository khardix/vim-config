" vimtex LaTeX setings

" Remove default flags
let g:vimtex_latexmk_options = ""

"let g:vimtex_quickfix_ignored_warnings = [
"  \ 'Underfull',
"  \ 'Overfull',
"  \ 'specifier changed to',
"  \ 'xparse/redefine-command',
"  \ ]
let g:vimtex_quickfix_ignore_all_warnings = 1

" YCM support
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
      \ ]
