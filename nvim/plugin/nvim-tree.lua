local status, nvim_tree = pcall(require, "nvim-tree")

if (not status) then
  return
end

nvim_tree.setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  modified = {
    enable = true,
  },
  view = {
    float = {
      enable = true,
    }
  },
  actions = {
    change_dir = {
      enable = false,
      restrict_above_cwd = true,
    }
  }
})
