---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  ---@type vim.lsp.Config
  return {
    name = 'taskfile',
    cmd = { 'taskfile-language-server' },
    filetypes = { 'yaml.taskfile' },
    root_markers = { '.git' },
    on_init = function()
      print('taskfile LSP init')
    end,
    on_error = function()
      print('taskfile LSP errored')
    end,
    on_attach = function()
      print('taskfile LSP attached')
    end,
    on_exit = function()
      print('taskfile LSP exited')
    end,
  }
end
