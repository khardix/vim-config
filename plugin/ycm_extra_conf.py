#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os

# Default C-family flags for projects
flags = [
    '-pedantic', '-Wall', '-Wextra',
]

# Extension to type mapping
filetype = {}
filetype.update({ext: 'c' for ext in ('.c',)})
filetype.update({ext: 'c-header' for ext in ('.h',)})
filetype.update({ext: 'c++' for ext in ('.cc', '.cpp', '.cxx')})
filetype.update({ext: 'c++-header' for ext in ('.hh', '.hpp', '.hxx')})

# Flags for different file types
typeflags = {
    'c': ['-std=c11'],
    'c-header': ['-std=c11'],
    'c++': ['-std=c++14'],
    'c++-header': ['-std=c++14'],
}


def FlagsForFile(filename, **kwargs):
    ext = os.path.splitext(filename)[-1]
    ftype = filetype.get(ext, 'c++')

    file_flags = flags + ['-x', ftype] + typeflags[ftype]

    return {'flags': file_flags, 'do_cache': True}
