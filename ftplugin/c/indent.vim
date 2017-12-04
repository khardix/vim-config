" Indentation adjustments for C family

set cindent nosmartindent       " Switch to C-specific indentation

" Do not indent access specifiers (public, protected, private)
set cinoptions+=g0
" In unclosed parenthesis:
" – one indent
" - closing parenthesis on same level as original line
set cinoptions+=(s,m1
" No indentation in 'namespace' and 'extern' blocks
set cinoptions+=N-s,E-s
" Break aligned with case
set cinoptions+=b1
