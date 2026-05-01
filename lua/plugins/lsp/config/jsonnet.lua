local default_capabilities = {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
  },
}

---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = vim.tbl_deep_extend('force', default_capabilities, make_default_capabilities())

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {},
    cmd = { 'jsonnet-language-server' },
    filetypes = { 'jsonnet', 'libsonnet' },
    root_markers = { '.git' },
  }
end
