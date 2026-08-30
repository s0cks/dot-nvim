---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    cmd = { 'ebnfer' },
    capabilities = capabilities,
    settings = {
      hyprls = {
        preferIgnoreFile = false,
        ignore = {},
      },
    },
    filetypes = { 'ebnf' },
  }
end
