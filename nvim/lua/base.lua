vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.completeopt = { "menuone", "noselect" }

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 22
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false         -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.clipboard:append { 'unnamedplus' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Colorscheme custom (gruvbox)
vim.o.background = "dark"

-- terminal
-- vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

vim.o.autoread = true

vim.g.neovide_scale_factor = 0.7
vim.g.neovide_fullscreen = true
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_cursor_trail_size = 0.3

-- copilot

vim.g.copilot_filetypes = {
  TelescopePrompt = false,
}

-- Remove tilde character
vim.opt.fillchars = {
  -- fold = ' ',
  -- vert = '|',
  eob = ' ',
  msgsep = '‾',

}

-- custom indentation for csharp files
vim.api.nvim_create_autocmd("FileType", {
  pattern = 'cs',
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})
