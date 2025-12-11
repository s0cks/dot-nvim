return {
  -- https://github.com/dhruvmanila/browser-bookmarks.nvim
  'dhruvmanila/browser-bookmarks.nvim',
  version = 'v4.0.0',
  dependencies = {
    'kkharji/sqlite.lua',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    selected_browser = 'buku',
  },
  keys = {
    {
      '<leader>fb',
      ':Telescope bookmarks<cr>',
      'n',
      desc = 'Search browser bookmarks using Telescope 🔭',
    },
  },
  init = function()
    require('telescope').load_extension('bookmarks')
  end,
}
