" Sets spacebar to the <leader> key
let mapleader = ' ' 

" Go back to netrw
nnoremap <leader>cd :Ex<CR>

" Keep current line in middle of page when jumping by half a page or when searching
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Delete text into void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Fuzzy finder
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<Space>
