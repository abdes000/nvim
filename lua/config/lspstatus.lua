local lsp_status = require('lsp-status')
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind 
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
lsp_status.register_progress()

lsp_status.config {
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ["start"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[1])
        },
        ["end"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[2])
        }
      }

      return require("lsp-status.util").in_range(cursor_pos, value_range)
    end
  end
}

update_current_function() -- Set/reset the b:lsp_current_function variable
-- Shows the current function, method, class, struct, interface, enum, module, or namespace
diagnostics() -- Return a table with all diagnostic counts for the current buffer
messages() -- Return a table listing progress and other status messages for display
register_progress() -- Register the provided handler for progress messages
register_client() -- Register a client for messages
-- Integrate misc. LS protocol extensions into the messages framework
-- Each extension table contains a set of handlers and a setup() function 
-- returning said handlers
extensions = { clangd, pyls_ms }
-- Set up a client for use with lsp-status. Calls register_client() and sets up 
-- buffer autocommands
on_attach(client) 
config(config_vals) -- Configure lsp-status
-- Table of client capabilities extended to signal support for progress messages
capabilities 
status() -- One example out-of-the-box statusline component (as shown in the images above)
lsp_status.register_progress()

local lspconfig = require('lspconfig')

-- Some arbitrary servers
lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

lspconfig.pyls_ms.setup({
  handlers = lsp_status.extensions.pyls_ms.setup(),
  settings = { python = { workspaceSymbols = { enabled = true }}},
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

lspconfig.ghcide.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
lspconfig.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})