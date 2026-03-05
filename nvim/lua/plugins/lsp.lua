return {
    { -- Mason installer
        {
            'mason-org/mason.nvim',
            opts = {
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    }
                }
            }
        }
    },
    { -- Mason bridge
        {
            'mason-org/mason-lspconfig.nvim',
            opts = { ensure_installed = { 'fortls', 'pyright' }, },
            dependencies = {
                { 'mason-org/mason.nvim', opts = {} },
                'neovim/nvim-lspconfig',
            },
        }
    },
    { -- LSP configuration
        'neovim/nvim-lspconfig',
        config = function()
            -- Fortran LSP
            vim.lsp.config('fortls', {
                cmd = { 'fortls' },
                filetypes = { 'fortran', 'f90', 'f95', 'f03', 'f08' },
                root_dir = vim.fs.root(0, { '.fortls', '.git' }),

                settings = {
                    nthreads = 4,
                    autocomplete = true,
                    hover_signature = true,
                    hover_compact = true,
                    variable_lookup = true,
                    symbol_hover = true,
                },
            })

            -- Python LSP
            vim.lsp.config('pyright', {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'basic', -- or 'off', 'strict'
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            -- Ensures float windows have a proper border
            local orig_open_floating_preview = vim.lsp.util.open_floating_preview
            vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or 'single' -- options: 'single', 'double', 'solid', 'rounded', 'shadow'
                return orig_open_floating_preview(contents, syntax, opts, ...)
            end

            -- Adjust colors
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1e1e1e' })
            vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#bfbfbf', bg = '#1e1e1e' })
        end
    },
    { -- nvim-cmp (autocomplete)
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                },
                {
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })
        end,
    },
}    
