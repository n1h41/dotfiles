local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  t = {
    name = "Trouble",
    l = {
      "<cmd>Trouble<CR>", "List"
    }
  }
}

whichkey.register(keymap, {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
