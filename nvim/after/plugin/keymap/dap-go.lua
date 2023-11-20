local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  d = {
    g = {
      t = {
        function()
          require("dap-go").debug_test()
        end,
        "Debug test",
      },
      l = {
        function()
          require("dap-go").debug_last()
        end,
        "Debug last",
      }
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
