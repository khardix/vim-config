# if in emty directory, clone self
test -z "$(ls .)" && git clone git@github.com:khardix/vim-config.git .

# link files
test -d "$HOME/.vim" || ln -s "$PWD" "$HOME/.vim"
test -f "$HOME/.vimrc" || ln -s "$PWD/vimrc" "$HOME/.vimrc"
test -f "$HOME/.gvimrc" || ln -s "$PWD/gvimrc" "$HOME/.gvimrc"

# Clone Vundle && install plugins
git clone git@github.com:gmarik/Vundle.vim.git bundle/Vundle.vim

vim +BundleInstall +qall
