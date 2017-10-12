" ViM GUI specific setup

set guioptions-=m   " Turn off menu bar
set guioptions-=T   " Turn off toolbar
set guioptions-=l   " Turn of left scroll bar
set guioptions-=L   " Turn of left scroll bar when split
set guioptions-=r   " Turn of right scroll bar
set guioptions-=R   " Turn of right scroll bar when split

set guicursor+=a:blinkon0   " Turn off blinking cursor

if has('win32')
    set guifont=Consolas:h11
else
    set guifont=Inconsolata\ 12
endif
