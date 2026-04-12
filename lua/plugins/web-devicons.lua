return {
  {
    'yamatsum/nvim-nonicons',
    version = '*',
    lazy = false,
    priority = 1000,
    dependencies = {
      {
        'kyazdani42/nvim-web-devicons',
        version = '*',
      },
    },
    opts = {},
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'yamatsum/nvim-nonicons',
      's0cks/flexoki.nvim',
    },
    opts = function()
      local c = require('flexoki.palette').palette()
      return {
        colors = {
          c['tx'],
          c['bg'],
          c['re'],
          c['ye'],
          c['gr'],
          c['pu'],
          c['ma'],
          c['cy'],
          c['bl'],
          c['or'],
        },
      }
    end,
    config = function(_, opts)
      require('tiny-devicons-auto-colors').setup(opts)
    end,
  },
}
