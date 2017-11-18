" Auto-load functions to help with clang tooling

" Return path to a compilation database. Returns empty string if none found.
function khardix#clang#compilation_database() abort
    return findfile('compile_commands.json', '.;')
endfunction
