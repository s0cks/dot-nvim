return {
  ---@url https://github.com/folke/snacks.nvim
  ---@type LazyPluginSpec
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = require('plugins.snacks.config'),
    keys = require('plugins.snacks.keys'),
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
        end,
      })
    end,
  },
}
