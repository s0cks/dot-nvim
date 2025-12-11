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
  },
  keys = {
    {
      '<leader>zm',
      function()
        Snacks.zen()
      end,
      { desc = 'Toggle Zen Mode' },
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      'n',
      desc = 'Toggle scratch buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      'n',
      desc = 'Select scratch buffer',
    },
    {
      '<leader>to',
      function() end,
      'n',
      desc = 'Open toggles',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
      end,
    })
  end,
}
