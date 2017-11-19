" General-purpose functions for working with CMake
"
" Call CMake in the current directory
function khardix#cmake#cmake() abort
    silent !cmake .
    redraw!
    doautocmd User CCompileDb  " Compile database changed
endfunction

" Clean current directory of CMake generated files
function khardix#cmake#clean() abort
    let l:nearest_root = findfile('CMakeLists.txt', '.;')

    " Do not delete anything if not in CMake tree
    if l:nearest_root == ''
        return
    endif

    " First, a `make clean` is in order
    if filereadable('Makefile')
        silent !make clean
    endif

    " Remove all generated files
    silent !find . -name Makefile -delete       " Makefiles
    silent !find . -iname '*.depends' -delete   " dependencies
    silent !find . -ipath '*cmake*' -not -name CMakeLists.txt -delete  " rest

    redraw!
    doautocmd User CCompileDb  " Compile database changed
endfunction

" Force CMake to generate compilation database
function khardix#cmake#database() abort
    silent !cmake . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    redraw!
    doautocmd User CCompileDb  " Compile database changed
endfunction
