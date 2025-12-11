return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      extensions = {
        heading = {
          treesitter = true,
        },
        ['ui-select'] = {},
      },
    },
    keys = {
      {
        '<leader>f',
        group = 'Search using  Telescope',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files()
        end,
        'n',
        desc = 'Find files using  Telescope',
      },
      {
        '<leader>fgr',
        function()
          require('telescope.builtin').live_grep()
        end,
        'n',
        desc = 'Find ripgrep +  Telescope',
      },
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    init = function()
      require('telescope').load_extension('ui-select')
    end,
  },
  {
    'crispgm/telescope-heading.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    init = function()
      require('telescope').load_extension('heading')
    end,
  },
  require('plugins.telescope.github'),
  require('plugins.telescope.glyph'),
  require('plugins.telescope.lazy'),
  require('plugins.telescope.software-licenses'),
  require('plugins.telescope.undo-history'),
  require('plugins.telescope.zoxide'),
}
