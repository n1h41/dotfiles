local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  c = {
    d = { "<cmd>Copilot disable<CR>", "Disable copilot" },
    e = { "<cmd>Copilot enable<CR>", "Enable copilot" }
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
