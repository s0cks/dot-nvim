return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        '\\',
        function()
          require('oil').open()
        end,
        desc = 'Opens oil in the project root directory',
      },
    },
    opts = {
      win_options = {
        signcolumn = 'yes:2',
      },
    },
  },
  {
    'JezerM/oil-lsp-diagnostics.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    opts = {},
  },
  {
    'refractalize/oil-git-status.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    opts = {},
  },
}
