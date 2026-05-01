---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {},
    cmd = {
      'vale-ls',
    },
    filetypes = {
      'asciidoc',
      'markdown',
      'text',
      'tex',
      'rst',
      'html',
      'xml',
      'typst',
      'yaml',
    },
    root_markers = {
      '.git',
      '.vale.ini',
    },
  }
end
