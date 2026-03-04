vim.opt.guicursor = '' -- Wider cursor in insert mode
vim.opt.cursorline = true -- Highlight the current line that the cursor is on

vim.opt.number = true -- Display line numbers
vim.opt.relativenumber = true -- Display relative line number

vim.opt.expandtab = true -- Enable 'tab' key to enter spaces instead of a tab character

-- Change number of spaces in a 'tab' entry
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Disable auto, smart, and advanced indentation
vim.opt.autoindent = false
vim.opt.smartindent = false
vim.opt.cindent = false

vim.opt.hlsearch = false -- Prevents Vim search from keeping searched terms highlighted
vim.opt.scrolloff = 8 -- When scrolling through a file, there will always be at least 8 lines above or below current line
vim.o.termguicolors = true -- For better colors in terminal
vim.opt.mouse = a -- Activate the mouse

-- Prevent continuing comment characters when entering a new line
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o', 'c' })
    end,
})

-- Set textwidth to Fortran max textwidth for word wrap
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        vim.opt_local.textwidth = 132
        vim.opt_local.formatoptions:append('t')
    end,
})

-- Show relative numbers in netrw
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        vim.wo.relativenumber = true
    end,
})

-- Instead of using Vim backups, give Undotree access to long-running undos (e.g., undos/versions from days ago)
--vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
--vim.opt.undofile = true
