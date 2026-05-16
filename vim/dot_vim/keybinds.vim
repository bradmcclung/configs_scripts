" Sets spacebar to the <leader> key
let mapleader = ' ' 

" Go back to netrw
nnoremap <leader>cd :Ex<CR>

" Fuzzy finder
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<Space>

" Keep current line in middle of page when jumping by half a page or when searching
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Yank into system clipboard (useful pasting text between Vim and other applications)
nnoremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>Y "+Y

" Delete text into void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d
