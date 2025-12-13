return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  return {
    capabilities = make_default_capabilities(),
    cmd = {
      'marksman',
      'server',
    },
    filetypes = {
      'markdown',
      'markdown.mdx',
    },
    root_markers = {
      '.git',
      '.marksman.toml',
    },
  }
end
