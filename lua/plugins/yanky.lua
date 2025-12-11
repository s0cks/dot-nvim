---@type LazyPluginSpec
return {
  'gbprod/yanky.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'folke/snacks.nvim',
    'nvim-telescope/telescope.nvim',
    'kepano/flexoki-neovim',
  },
  opts = {},
  keys = {
    {
      '<leader>P',
      function()
        require('telescope').extensions.yank_history.yank_history()
      end,
      { 'n', 'x' },
      desc = 'Open yank history',
    },
  },
  init = function()
    require('telescope').load_extension('yank_history')

    local c = require('flexoki.palette').palette()
    vim.api.nvim_set_hl(0, 'YankyPut', {
      bg = c['pu'],
    })
    vim.api.nvim_set_hl(0, 'YankyYanked', {
      bg = c['ma'],
    })
  end,
}
