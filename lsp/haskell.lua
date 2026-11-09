return {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell', 'lhashkell', 'cabal', 'cabalproject' },
  settings = {
    haskell = {
      formattingProvider = 'fourmolu',
    },
  },
}
