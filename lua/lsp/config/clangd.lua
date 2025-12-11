local lspconfig = require('lspconfig')

local M = {}

function M:make_capabilities(overrides)
  return {
    capabilities = overrides,
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
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_dir = lspconfig.util.root_pattern('.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git'),
    single_file_support = true,
  }
end

function M:make_settings(settings)
  --- TODO: @s0cks implement
  return settings
end

return M
