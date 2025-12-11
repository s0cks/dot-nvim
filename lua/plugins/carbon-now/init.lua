return {
  {
    'ellisonleao/carbon-now.nvim',
    lazy = true,
    cmd = 'CarbonNow',
    opts = require('plugins.carbon-now.config'),
    keys = {
      {
        '<leader>cn',
        '<cmd>CarbonNow<cr>',
        'n',
        desc = 'Create snippet using carbon-now',
      },
    },
  },
}
