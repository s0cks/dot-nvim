---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('lsp.capabilities')
  local capabilities = make_default_capabilities()
  ---@type vim.lsp.Config
  return {
    cmd = {
      'bash-language-server',
      'start',
    },
    filetypes = { 'bash', 'sh', 'zsh' },
    capabilities = capabilities,
    settings = {
      bashIde = {
        globPattern = '*@(.zsh|.sh|.inc|.bash|.command)',
      },
      filetypes = {
        'sh',
        'zsh',
      },
    },
  }
end
