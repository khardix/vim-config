"Solarized dark for GUI
syntax enable
set background=dark
colorscheme solarized

set display=lastline "Display ed of line instead of @@@
set guioptions=acigt "GUI settings - see :help guioptions
set guifont=Inconsolata\ 11
set scrolloff=3 "Minimum number of lines before and after cursor
set sidescroll=5 "Side scrolling width in characters

" === Status line === "
set laststatus=2
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ Radek\ %l/%L,\ Sloupec\ %c%V\ \ %P

" === Window title === "
set title
set titlestring=gViM\ [%t]

set guicursor+=a:blinkon0 "Disable cursor blinking
set visualbell "Visual, not acustic bell

set mousemodel=popup "RMB launches popup menu
