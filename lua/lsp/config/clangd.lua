local lspconfig = require('lspconfig')

return function()
  local make_default_capabilities = require('lsp.capabilities')
  local capabilities = make_default_capabilities()

  return {
    capabilities = capabilities,
    settings = {},
    cmd = {
      '/usr/bin/clangd',
      '--background-index',
      '--clang-tidy',
      '--header-insertion=iwyu',
      '--completion-style=detailed',
      '--function-arg-placeholders',
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
      semanticHighlighting = true,
    },
    filetypes = { 'c', 'cpp', 'cc', 'objc', 'objcpp', 'cuda', 'proto' },
    -- root_dir = lspconfig.util.root_pattern('.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git'),
    single_file_support = true,
  }
end
