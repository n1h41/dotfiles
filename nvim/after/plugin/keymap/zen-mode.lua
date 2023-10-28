local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  t = {
    t = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },
  }
}

whichkey.register(keymap, {
  silent = true,
  noremap = true,
})
