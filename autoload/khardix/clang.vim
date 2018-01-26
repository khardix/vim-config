" Auto-load functions to help with clang tooling

" Return path to a compilation database. Returns empty string if none found.
function khardix#clang#compilation_database() abort
    " First, try to find the file deeper in the tree
    " Useful for CMake's out-of-source builds
    " Limit to depth 3 to speed up accidental searches in ~, etc.
    let l:cwd_database = findfile('compile_commands.json', 'build,**3')
    if strlen(l:cwd_database)  " database found
        return l:cwd_database
    else
        " Attempt upward search
        return findfile('compile_commands.json', '.;')
    endif
endfunction
