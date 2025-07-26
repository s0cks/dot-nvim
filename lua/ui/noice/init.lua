return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'rcarriga/nvim-notify',
    'MunifTanjim/nui.nvim',
  },
  opts = require('ui.noice.config'),
}
