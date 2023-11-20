---@diagnostic disable: missing-fields
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = { "", "" },
    indicator = {
      style = 'none',
    },
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        separator = true,
      }
    },
    custom_filter = function(buf_number, buf_numbers)
      if vim.fn.bufname(buf_number) ~= "NvimTree_1" then
        return true
      end
    end
  },
  highlights = {
    separator = {
      fg = '#4b5b87',
    },
    separator_selected = {
      fg = '#4b5b87',
    },
    background = {
      fg = '#657b83',
      -- bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
      italic = false,
    },
    fill = {
      bg = '#21283b'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
