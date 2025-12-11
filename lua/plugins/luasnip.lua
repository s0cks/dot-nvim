return {
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    opts = {
      snippet_paths = {
        vim.fn.stdpath('config') .. '/snippets',
        vim.fn.getcwd() .. '/.vscode/snippets',
        vim.fn.getcwd() .. '/.snippets',
      },
    },
    config = function(_, opts)
      require('luasnip.loaders.from_vscode').lazy_load({
        paths = opts.snippet_paths,
      })
    end,
  },
}
