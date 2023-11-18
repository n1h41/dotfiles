--[[ local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  c = {
    n = { "<cmd>lua require('notify').dismiss()<cr>", "Close all notifications" },
  }
}

whichkey.register(keymap, {
  silent = true,
  noremap = true,
}) ]]
