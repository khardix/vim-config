" Set-up dialect and omnicompletion options for SQL

let g:sql_type_default = 'pgsql'    " Use PostgreSQL by default

" Only use static syntax completion for SQL files
let b:mucomplete_chain = ['file', 'sqla', 'keyn']
