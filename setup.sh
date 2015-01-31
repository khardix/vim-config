# if in emty directory, clone self
test -z "$(ls .)" && git clone git@github.com:khardix/vim-config.git .

# Clone Vundle && install plugins
git clone git@github.com:gmarik/Vundle.vim.git bundle/Vundle.vim

vim +BundleInstall +qall
