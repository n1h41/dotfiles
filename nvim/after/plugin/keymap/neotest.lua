local status, whichkey = pcall(require, "which-key")
if (not status) then return end

local keymap = {
  t = {
    "Tests",
    w = { "<cmd>lua require('neotest').summary.toggle()<CR>", "Open test's list" },
    r = { '<cmd>lua require("neotest").run.run()<CR>', "Run nearest test" },
    d = { '<cmd>lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})<CR>', "Debug nearest test" },
  }
}

whichkey.register(keymap, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
