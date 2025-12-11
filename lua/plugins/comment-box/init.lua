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
    init = function()
      local wk = require('which-key')

      wk.add({
        { '<leader>c', group = 'Comment Box' },
        { '<leader>cb', '<cmd>CBlcbox4<cr>', desc = 'Left center box #4', mode = { 'n', 'v' } },
        { '<leader>ct', '<cmd>CBllline<cr>', desc = 'Titled line', mode = { 'n', 'v' } },
        { '<leader>cl', '<cmd>CBline<cr>', desc = 'Simple line', mode = { 'n', 'v' } },
        { '<leader>cm', '<cmd>CBllbox14<cr>', desc = 'Marked box', mode = { 'n', 'v' } },
        { '<leader>cd', '<cmd>CBd<cr>', desc = 'Delete box', mode = { 'n', 'v' } },
      })
    end,
  },
}
