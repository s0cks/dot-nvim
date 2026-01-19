local vault = require('plugins.obsidian.vault')
return {
  ---@type LazyPluginSpec
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    cmd = 'Obsidian',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = require('plugins.obsidian.config'),
  },
}
