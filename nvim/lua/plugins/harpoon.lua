local conf = require('telescope.config').values
local themes = require('telescope.themes')
local make_entry = require('telescope.make_entry')

-- Helper function to use telescope on harpoon list
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    local opts = themes.get_dropdown({
        promt_title = 'Working List'
    })
    local finder = require('telescope.finders').new_table({
        results = file_paths,
        entry_maker = make_entry.gen_from_file(opts),
    })
    require('telescope.pickers').new(opts, {
        finder = finder,
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),
    }):find()
end

return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nim-lua/plenary.nvim' },
    config = function()
        local harpoon = require('harpoon')
        vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
        vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set('n', '<leader>h', function () toggle_telescope(harpoon:list()) end,
            { desc = 'Open harpoon window' })
        vim.keymap.set('n', '<C-p>', function() harpoon:list():prev() end)
        vim.keymap.set('n', '<C-n>', function() harpoon:list():next() end)
    end
}
