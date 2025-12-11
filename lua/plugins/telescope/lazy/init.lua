return {
  'tsakirist/telescope-lazy.nvim',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    theme = 'ivy',
    show_icon = true,
  },
  init = function()
    require('telescope').load_extension('lazy')
  end,
  keys = {
    {
      '<leader>flp',
      ':Telescope lazy<cr>',
      'n',
      desc = 'Search lazy plugins w/ Telescope 🔭',
    },
  },
}
