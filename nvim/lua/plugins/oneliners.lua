return {
    { -- Show CSS colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
--     { --Undotree
--         'mbbill/undotree',
--         vim.keymap.set('n', '<leader>u', vim.vmd.UndotreeToggle)
--     },
}
