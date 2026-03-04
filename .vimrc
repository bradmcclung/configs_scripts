set textwidth=132 " Set textwidth to Fortran max textwidth for word wrap

set cursorline " Underlines current line
highlight CursorLine cterm=none guibg=#444444 " Removes underline and highlights current line
highlight CursorLineNr cterm=none " Removes underline for line numbers

set number " Display line numbers
set relativenumber " Display relative line number

set expandtab " Enable 'tab' key to enter spaces instead of a tab character

" Change number of spaces in a 'tab' entry
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Disable auto, smart, and advanced indentation
set noautoindent
set nosmartindent
set nocindent

set nohlsearch " Prevents Vim search from keeping searched terms highlighted
set scrolloff=8 " When scrolling through a file, there will always be at least 8 lines above or below current line
set termguicolors " For better colors in terminal

set mouse=a " Activate the mouse

" Prevent continuing comment characters when entering a new line
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
