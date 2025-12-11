return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand('~') .. '/Obsidian/*.md',
      'BufNewFile ' .. vim.fn.expand('~') .. '/Obsidian/*.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = require('plugins.obsidian.config'),
  },
}
