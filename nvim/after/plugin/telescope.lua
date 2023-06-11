local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close
            }
        }
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ff',
    '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>', opts)
vim.keymap.set('n', '<leader>fr',
    '<cmd>lua require("telescope.builtin").live_grep({ no_ignore = false, hidden = true })<cr>', opts)
