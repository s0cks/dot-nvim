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
}
