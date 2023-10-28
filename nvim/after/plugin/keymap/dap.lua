local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  d = {
    name = "Debug",
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    u = {
      i = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      s = { function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end, "UI Sidebar" }
    },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
  },
  g = {
    name = "Go",
    d = {
      name = "Debug",
      t = { function()
        require("dap-go").debug_test()
      end,
        "Debug Go test"
      },
      l = {
        function()
          require("dap-go").debug_last()
        end,
        "Debug Last Go test"
      }
    },
    a = {  }
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

local keymap_v = {
  name = "Debug",
  e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
}
whichkey.register(keymap_v, {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
