return {
  ---@type LazyPluginSpec
  {
    'LudoPinelli/comment-box.nvim',
    event = 'VeryLazy',
    version = '*',
    dependencies = {
      'folke/which-key.nvim',
    },
    opts = {},
    keys = {
      {
        '<leader>cb',
        group = 'Comment Box',
      },
      {
        '<leader>cbtl',
        '<cmd>CBllline<cr>',
        { 'n', 'v' },
        desc = 'Insert titled line box',
      },
      {
        '<leader>cbl',
        '<cmd>CBline<cr>',
        { 'n', 'v' },
        desc = 'Insert simple line box',
      },
      {
        '<leader>cbm',
        '<cmd>CBllbox14<cr>',
        { 'n', 'v' },
        desc = 'Insert marked box',
      },
      {
        '<leader>cbd',
        '<cmd>CBd<cr>',
        { 'n', 'v' },
        desc = 'Delete box',
      },
    },
  },
}
