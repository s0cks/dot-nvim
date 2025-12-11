return {
  'nvim-telescope/telescope-github.nvim',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    {
      '<leader>fghi',
      ':Telescope gh issues<cr>',
      'n',
      desc = 'Find GitHub  Issues w/ Telescope 🔭',
    },
    {
      '<leader>fghpr',
      ':Telescope gh pull_request<cr>',
      'n',
      desc = 'Find GitHub  Pull Requests w/ Telescope 🔭',
    },
  },
}
