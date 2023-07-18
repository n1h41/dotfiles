local status, lsp_zero = pcall(require, "lsp-zero")

if (not status) then
  return
end

lsp_zero.preset('recommended')

lsp_zero.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', "gopls", "html", "cssls", "tailwindcss" })


local cmp = require('cmp')

local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-y>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping.confirm({
    select = false
  })
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local lspkind = require('lspkind')

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = { {
    name = 'nvim_lsp'
  }, {
    name = 'path'
  }, {
    name = 'luasnip'
  }, {
    name = 'buffer',
    keyword_length = 5
  } },
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
    })
  }
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.on_attach(on_attach)

lsp_zero.capabilities = capabilities


lsp_zero.configure('tsserver', {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
})

lsp_zero.setup()

require("fidget").setup({})
