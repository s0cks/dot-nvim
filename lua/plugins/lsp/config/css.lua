---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    cmd = { 'vscode-css-language-server', '--stdio' },
    capabilities = capabilities,
    filetypes = {
      'css',
      'scss',
      'less',
    },
    settings = {
      css = { validate = true },
      less = { validate = true },
      scss = { validate = true },
    },
  }
end
