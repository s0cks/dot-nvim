return {
  'jvgrootveld/telescope-zoxide',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
  },
  opts = {},
  keys = {
    {
      '<leader>tz',
      ':Telescope zoxide list<cr>',
      'z',
      desc = 'Search Zoxide using Telescope 🔭',
    },
  },
}
