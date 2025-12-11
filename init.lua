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
  },
  install = {
    colorscheme = { 'flexoki-dark' },
    missing = true,
  },
  checker = { enabled = false, notify = false },
})
