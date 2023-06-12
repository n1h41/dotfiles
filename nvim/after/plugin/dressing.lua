local status, dressing = pcall(require, "dressing")

if (not status) then
  return
end

dressing.setup({
  input = {
    win_options = {
      winblend = 0
    },
    select = {
      telescope = require("telescope.themes").get_ivy({...})
    }
  }
})
