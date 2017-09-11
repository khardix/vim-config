"""Plugin management and configuration"""

" Find the root directory
let s:vimdir = split(&runtimepath, ',')[0]

" Install the plugin manager if it is not present
let s:plugin_manager = s:vimdir . '/autoload/plug.vim'
if empty(glob(s:plugin_manager))
    let s:install_cmd  = ['curl']
    let s:install_cmd += ['--fail', '--location', '--create-dirs']
    let s:install_cmd += ['--output', s:plugin_manager]
    let s:install_cmd += ['https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim']

    execute 'silent! ' . join(s:install_cmd)

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install the plugins
call plug#begin(s:vimdir . '/plugged')

call plug#end()
