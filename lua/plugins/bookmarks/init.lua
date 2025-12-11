return {
  {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      selected_browser = 'buku',
    },
  },
}
