require('telescope').load_extension('flutter')

vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope flutter commands<CR>', { noremap = true, silent = true })
