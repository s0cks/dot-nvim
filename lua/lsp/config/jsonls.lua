---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {},
  }
end
