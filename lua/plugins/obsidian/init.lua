local vault = require('plugins.obsidian.vault')
return {
  {
    ---@url https://github.com/obsidian-nvim/obsidian.nvim
    ---@type LazyPluginSpec
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
      'BufReadPre ' .. vault.path .. '/*.md',
      'BufNewFile ' .. vault.path .. '/*.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = require('plugins.obsidian.config'),
  },
}
