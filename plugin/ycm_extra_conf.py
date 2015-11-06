#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import ycm_core

# Default C-family flags for projects
flags = [
  '-pedantic', '-Wall', '-Wextra',
]

def FlagsForFile(filename, **kwargs):
  if re.match(r'\.c$', filename):
    flags.extend(['-std=c99', '-x', 'c'])
  else:
    flags.extend(['-std=c++11', '-x', 'c++'])

  return { 'flags': flags, 'do_cache': True }
