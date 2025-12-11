---@url https://github.com/OXY2DEV/markview.nvim
---@type LazyPluginSpec
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  priority = 49,
  dependencies = {
    'saghen/blink.cmp',
  },
  opts = {},
  keys = {
    {
      '<leader>mv',
      '<cmd>Markview<cr>',
      'n',
      desc = 'Toggle Markview',
    },
  },
}
