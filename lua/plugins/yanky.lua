---@type LazyPluginSpec
return {
  'gbprod/yanky.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'folke/snacks.nvim',
    'nvim-telescope/telescope.nvim',
    'kepano/flexoki-neovim',
    'kkharji/sqlite.lua',
  },
  opts = {
    ring = {
      storage = 'sqlite',
    },
    preserve_cursor_position = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>Y',
      function()
        require('theme.utils').telescope_extension('yank_history')
      end,
      'n',
      desc = 'Open yank history',
    },
  },
  init = function()
    require('telescope').load_extension('yank_history')
    local utils = require('theme.utils')
    utils.set_global_hl_bg({
      YankyPut = 'pu',
      YankyYanked = 'ma',
    })
  end,
}
