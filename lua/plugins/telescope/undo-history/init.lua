return {
  'debugloop/telescope-undo.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  config = function()
    require('telescope').load_extension('undo')
  end,
  keys = {
    {
      '<leader>tu',
      ':Telescope undo<cr>',
      'n',
      desc = 'Search undo history w/ Telescope 🔭',
    },
  },
}
