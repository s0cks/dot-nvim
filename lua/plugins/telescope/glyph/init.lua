return {
  'ghassan0/telescope-glyph.nvim',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    {
      '<leader>fgl',
      ':Telescope glyph<cr>',
      'n',
      desc = 'Search for a font glyph using Telescope 🔭',
    },
  },
}
