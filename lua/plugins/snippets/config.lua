return {
  snippet_paths = {
    vim.fn.stdpath('config') .. '/snippets',
    vim.fn.getcwd() .. '/.vscode/snippets',
    vim.fn.getcwd() .. '/.snippets',
  },
}
