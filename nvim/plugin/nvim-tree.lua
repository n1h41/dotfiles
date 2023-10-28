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
    icons = {
      git_placement = "after",
      show = {
        file = true,
        folder = true,
        git = true,
        folder_arrow = true,
      },
      glyphs = {
        git = {
          unstaged = "U",
          staged = "S",
          unmerged = "UM",
          renamed = "R",
          untracked = "UT",
          deleted = "D",
          ignored = "I",
        },
      }
    }
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
      enable = false,
    }
  },
  actions = {
    change_dir = {
      enable = true,
      restrict_above_cwd = true,
    }
  },
  tab = {
    sync = {
      open = true,
      close = true,
    }
  }
})
