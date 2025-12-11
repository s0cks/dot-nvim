return {
  'chip/telescope-software-licenses.nvim',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    {
      '<leader>fswl',
      ':Telescope software-licenses find<cr>',
      'n',
      desc = 'Find and insert a license using Telescope 🔭',
    },
  },
  opts = {},
}
