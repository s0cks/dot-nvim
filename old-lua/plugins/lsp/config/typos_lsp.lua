---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    cmd = { 'typos-lsp' },
    capabilities = capabilities,
    settings = {},
    root_markers = {
      'typos.toml',
      '_typos.toml',
      '.typos.toml',
      'pyproject.toml',
      'Cargo.toml',
    },
  }
end
