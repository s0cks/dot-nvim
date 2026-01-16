return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  opts = {

  },
  keys = function()
    local builtin = require('telescope.builtin')
    return {
      {
        '<leader>ftp',
        builtin.pickers,
        { 'n', },
        {
          silent = true,
          desc = "Search for Telescope 󰭎 pickers using Telescope 󰭎"
        },
      },
      {
        '<leader>fhl',
        builtin.highlights,
        { 'n' },
        {
          silent = true,
          desc = 'Search for highlights using Telescope 󰭎',
        }
      }
    }
  end
}
