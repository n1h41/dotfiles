local status, lsp_zero = pcall(require, "lsp-zero")

if (not status) then
  return
end

lsp_zero.preset('recommended')

lsp_zero.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', "gopls", "html", "cssls", "tailwindcss", "templ" })


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

  if client.server_capabilities.colorProvider then
    require("document-color").buf_attach(bufnr)
  end
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

capabilities.textDocument.colorProvider = {
  dynamicRegistration = true
}

lsp_zero.capabilities = capabilities


lsp_zero.configure('tsserver', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
})

local flutter = require('flutter-tools')

-- alternatively you can override the default configs
flutter.setup {
  ui = {
    border = "rounded",
    notification_style = 'plugin'
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = true,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = true,
      -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      -- this will show the currently selected project configuration
      project_config = true,
    }
  },

  debugger = {           -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {}
  },
  flutter_path = "/home/n1h41/flutter/bin/flutter", -- <-- this takes priority over the lookup
  fvm = false,                                      -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = true,
  },
  dev_log = {
    enabled = true,
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "tabnew",   -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false,         -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false    -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = {                                        -- show the derived colours for dart variables
      enabled = true,                                -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true,                             -- highlight the background
      background_color = { r = 19, g = 17, b = 24 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false,                            -- highlight the foreground
      virtual_text = true,                           -- show the highlight using virtual text
      -- virtual_text_str = "■",                     -- the virtual text character to highlight
    },
    on_attach = on_attach,
    capabilities = capabilities, -- e.g. lsp_status capabilities
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}

local util = require("lspconfig.util")

lsp_zero.configure('gopls', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl"--[[ , "templ" ]] },
  root_dir = util.root_pattern("go.mod", ".git", "go.work"),
})

lsp_zero.configure('templ', {
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp_zero.configure('html', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

lsp_zero.configure('htmx', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

lsp_zero.configure('emmet_language_server', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "templ" },
})

lsp_zero.configure('tailwindcss', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "templ", "astro", "javascript", "typescript", "react" },
  init_options = { userLanguages = { templ = "html" } },
  root_dir = util.root_pattern("tailwind.config.js", "postcss.config.js", "tailwind.config.ts", "postcss.config.ts",
    "package.json"),
})

lsp_zero.setup()

require("fidget").setup({})
