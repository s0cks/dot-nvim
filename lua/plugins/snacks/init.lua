---@type LazyPluginSpec
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = { enabled = true },
    notifier = { enabled = true },
    scope = {},
    image = {},
    statuscolumn = {},
    toggle = {
      enabled = true,
      which_key = true,
    },
    gh = {},
    git = {},
    input = {},
    words = {},
    win = {},
    gitbrowse = {},
    scratch = {},
    scroll = { enabled = true },
    zen = {},
    terminal = require('plugins.snacks.terminal'),
    dashboard = require('plugins.snacks.dashboard'),
  },
  keys = {
    {
      '<leader>Z',
      function()
        Snacks.zen()
      end,
      'n',
      desc = 'Enter zen mode',
    },
    {
      '<leader>S',
      group = 'Scratch',
    },
    {
      '<leader>So',
      function()
        Snacks.scratch()
      end,
      'n',
      desc = 'Toggle scratch buffer',
    },
    {
      '<leader>Ss',
      function()
        Snacks.scratch.select()
      end,
      'n',
      desc = 'Search scratch buffers',
    },
  },
  init = function()
    vim.is_testing = false
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
      end,
    })
  end,
}
