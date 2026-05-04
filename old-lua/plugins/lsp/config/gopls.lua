---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  return  --[[@type vim.lsp.Config]]{
    capabilities = make_default_capabilities(),
    settings = {
      gopls = {},
    },
  }
end
