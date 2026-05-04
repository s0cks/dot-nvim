---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require('schemastore').json.schemas({
          extra = {},
        }),
        validate = { enable = true },
      },
    },
  }
end
