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
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    root_markers = { '.git', 'pubspec.yaml', 'pubspec.yml' },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
    },
    init_options = {
      outline = true,
      closingLabels = true,
      flutterOutline = true,
      suggestFromUnimportedLibraries = true,
      onlyAnalyzeProjectsWithOpenFiles = true,
    },
    capabilities = capabilities,
  }
end
