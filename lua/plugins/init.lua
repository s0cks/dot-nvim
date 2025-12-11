return {
  {
    'gbprod/yanky.nvim',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'deathbeam/autocomplete.nvim',
    version = '*',
    config = function(_, opts)
      require('autocomplete.cmd').setup(opts.cmd or {})
    end,
  },
  {
    'mateuszwieloch/automkdir.nvim',
    opts = {},
  },
  {
    'OXY2DEV/helpview.nvim',
    lazy = false,
    opts = {},
  },
  ---@url https://github.com/ellisonleao/dotenv.nvim
  ---@type LazyPluginSpec
  {
    'ellisonleao/dotenv.nvim',
    opts = {
      enable_on_load = true,
    },
  },
}
