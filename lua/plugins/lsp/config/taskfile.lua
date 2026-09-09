---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {},
    cmd = {
      'taskfile-lsp',
    },
    filetypes = {
      'taskfile',
      'yaml.taskfile',
    },
    root_markers = {
      '.git',
      'Taskfile.yaml',
    },
  }
end
