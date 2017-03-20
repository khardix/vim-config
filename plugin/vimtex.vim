" vimtex LaTeX setings

" Remove default flags
let g:vimtex_latexmk_options = ""

" Disable warnings
let g:vimtex_quickfix_warnings = {'default': 0}

" YCM support
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
      \ ]
