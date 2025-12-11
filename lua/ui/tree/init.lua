return {
  'nvim-neo-tree/neo-tree.nvim',
  version = 'v3.x',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim',
  },
  keys = require('ui.tree.keys'),
  opts = require('ui.tree.config'),
  config = function(_, opts)
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        },
      },
    })
    require('neo-tree').setup(opts or {})
  end,
}
