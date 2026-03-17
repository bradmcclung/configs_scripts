return {
    {
        'rebelot/kanagawa.nvim',
        -- Make sure color scheme loads first
        lazy = false,
        priority = 1000,

        config = function()
            require('kanagawa').setup({
                compile = false, -- Prevents caching highlights, which could overwrite Treesitter
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
            })
            vim.cmd('colorscheme kanagawa-wave')

            -- Adjust some colors
            vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#555555' })
            vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#dddddd', bg = '#333333', bold = true })

            -- Make backgrounds transparent
            local backs = {'Normal', 'NormalFloat', 'SignColumn', 'LineNr', 'FoldColumn', 'FloatBorder', 'TelescopeBorder'}
            for _, back in ipairs(backs) do
                vim.api.nvim_set_hl(0, back, { bg = 'none' })
            end

            -- Adjust font color
            local teles = { 'TelescopePromptTitle', 'TelescopePromptCounter', 'TelescopePreviewTitle', 'TelescopeResultsTitle' }
            for _, tele in ipairs(teles) do
                vim.api.nvim_set_hl(0, tele, { fg = '#bfbfbf' })
            end
        end,
    },
}
