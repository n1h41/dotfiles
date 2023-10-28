local keymap = vim.keymap

keymap.set('n', 'x', '"_x')
vim.g.mapleader = ' '

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<CR>')

-- Change tab
keymap.set('n', '<Tab>', 'gt')
keymap.set('n', '<S-Tab>', 'gT')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move to window
keymap.set('n', '<Space><Space>', '<C-w>w')
keymap.set('n', 'sc', '<C-w>c')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Move window
keymap.set('', 'sH', '<C-w>H')
keymap.set('', 'sK', '<C-w>K')
keymap.set('', 'sJ', '<C-w>J')
keymap.set('', 'sL', '<C-w>L')

-- Resize window
keymap.set('n', 's<left>', '<C-w>>')
keymap.set('n', 's<right>', '<C-w><')
keymap.set('n', 's<up>', '<C-w>+')
keymap.set('n', 's<down>', '<C-w>-')

-- Format
keymap.set("n", "<S-A-f>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

keymap.set('n', "<C-i>", "<C-i>", { noremap = true })

-- Copy current file name to clipboard
keymap.set('n', '<leader>fn', ':let @+=expand("%:t")<CR>')
