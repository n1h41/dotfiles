local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<c-n>', '<cmd>NvimTreeFindFile<cr>', opts)
vim.keymap.set('n', '<c-t>', '<cmd>NvimTreeFocus<cr>', opts)
