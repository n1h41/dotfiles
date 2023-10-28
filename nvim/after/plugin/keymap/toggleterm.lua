local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = 'float',
})

function Lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
