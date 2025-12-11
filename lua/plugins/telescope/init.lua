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
    init = function()
      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fgr', telescope.live_grep, { desc = 'Telescope live grep' })
    end,
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
