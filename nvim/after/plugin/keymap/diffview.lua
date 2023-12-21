local status, whichkey = pcall(require, "which-key")
if (not status) then return end

local keymap = {
  d = {
    v = { "<cmd>DiffviewOpen<cr>", "Open Diff view" },
    q = { "<cmd>DiffviewClose<cr>", "Close Diff view" }
  },
  t = {
    h = { "<cmd>DiffviewFileHistory<cr>", "Toggle history" }
  },
  f = {
    h = { "<cmd>DiffviewFileHistory %<cr>", "Show current file history" }
  }
}

whichkey.register(keymap, {
  mode = "n",
  -- prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
