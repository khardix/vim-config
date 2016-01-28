" When in Goyo mode, hide all you can and turn on fullscreen

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set showtabline=0

  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set showtabline=1

  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

" Ensure proper cleanup on quitting the vim
function! s:goyo_quit()
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd VimLeavePre * call <SID>goyo_quit()
