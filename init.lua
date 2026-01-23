---@author tazz
---@license MIT

require('strings')
require('settings')
require('mappings')

local utils = require('utils')
-- Bootstrap lazy.vim
utils.clone_and_add_to_rtp('folke/lazy.nvim', vim.fn.stdpath('data') .. '/lazy/lazy.nvim')
require('lazy').setup({
  spec = {
    require('theme'),
    { import = 'plugins' },
    {
      'cmdline',
      event = 'VeryLazy',
      lazy = true,
      dir = vim.fn.expand('$XDG_CONFIG_HOME/nvim/lua/cmdline'),
      opts = {},
      config = function(_, opts)
        require('cmdline').setup(opts or {})
      end,
    },
  },
  install = {
    colorscheme = { 'flexoki-dark' },
    missing = true,
  },
  checker = { enabled = false, notify = false },
})
