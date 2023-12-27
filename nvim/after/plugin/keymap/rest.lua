local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local rest = require("rest-nvim")

local keymap = {
  r = {
    r = { rest.run, "Run request" }
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
