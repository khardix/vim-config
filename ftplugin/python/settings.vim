"""Python-specific ViM settings"""

augroup python3
    autocmd! BufEnter *.py setlocal omnifunc=python3complete#Complete
augroup end
