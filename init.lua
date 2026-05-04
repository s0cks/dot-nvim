---@author tazz
---@license MIT

require('settings')

-- require('strings')
-- require('mappings')

local utils = require('utils')
-- Bootstrap lazy.vim
-- utils.clone_and_add_to_rtp('folke/lazy.nvim', vim.fn.stdpath('data') .. '/lazy/lazy.nvim')
--
-- utils.create_autocmds(require('autocmds'))

-- require('lazy').setup({
--   spec = {
--     require('theme'),
--     { import = 'plugins' },
--   },
--   install = {
--     colorscheme = { 'flexoki-dark' },
--     missing = true,
--   },
--   checker = { enabled = false, notify = false },
-- })

vim.pack.add({
  "https://github.com/s0cks/flexoki.nvim",
})
vim.cmd([[colorscheme flexoki-dark]])
