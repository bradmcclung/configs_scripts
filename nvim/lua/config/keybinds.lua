local map = vim.keymap.set

vim.g.mapleader = ' ' -- Sets spacebar to the <leader> key
map('n', '<leader>cd', vim.cmd.Ex) -- Executes the :Ex command (go back to nvim's file explorer netrw)

-- User J or K to move highlighted text in visual line mode and autoindent (e.g., into if statements, for loops, etc.)
map('v', 'J', [[:m '>+1<CR>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])

map('n', 'J', 'mzJ`z') -- Keeps cursor in place instead of moving to the end of the line when executing J in normal mode

-- Keep current line in middle of page when jumping by half a page or when searching
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Yank text into system clipboard (useful for pasting text in Vim to other programs and applications
map({'n', 'v'}, '<leader>y', [["+y]])
map('v', '<leader>Y', [["+Y]])

-- Paste from system clipboard
map('x', '<leader>p', [["+p]])

-- Delete text into void register (useful if you want to delete something without overwriting
-- the standard vim register, e.g., text you copied and want to paste later)
map({'n', 'v'}, '<leader>d', [["_d]])

-- While in a bash script, give it executable permissions
map('n', '<leader>ux', '<cmd>!chmod u+x %<CR>', {silent = true})

-- Replace double quotes with single quotes
map('v', '<leader>gq', [[:s/"/'/g<CR>]]) -- greedy, no confirm
map('v', '<leader>gcq', [[:s/"/'/gc]]) -- greedy with confirm

-- LSP keymaps
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
--map('n', 'gr', vim.lsp.buf.reference, { desc = 'References' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Implementation' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>f', function() vim.lsp.buf.format() end, { desc = 'Format' })
