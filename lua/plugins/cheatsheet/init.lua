return {
  ---@type LazyPluginSpec
  {
    'doctorfree/cheatsheet.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    version = '*',
    config = require('plugins.cheatsheet.config'),
  },
}
