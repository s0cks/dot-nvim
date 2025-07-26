return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {},
    init = function()
      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
    end,
  },
  {
    'ghassan0/telescope-glyph.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
      {
        '<leader>tfg',
        ':Telescope glyph<cr>',
        'n',
        desc = 'Search for a font glyph using Telescope 🔭',
      },
    },
  },
  {
    'nvim-telescope/telescope-github.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
      {
        '<leader>tgi',
        ':Telescope gh issues<cr>',
        'n',
        desc = 'Find GitHub  issues w/ Telescope 🔭',
      },
      {
        '<leader>tgp',
        ':Telescope gh pull_request<cr>',
        'n',
        desc = 'Find GitHub  pull requests w/ Telescope 🔭',
      },
    },
  },
  {
    'chip/telescope-software-licenses.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {
        '<leader>tl',
        ':Telescope software-licenses find<cr>',
        'n',
        desc = 'Find and insert a license using Telescope 🔭',
      },
    },
    opts = {},
  },
  {
    'crispgm/telescope-heading.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
  },
  {
    'kelly-lin/telescope-ag',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
      {
        '<leader>tag',
        function()
          local query = vim.fn.input('Query using Ag:')
          require('telescope').extensions.ag.search(query)
        end,
        'n',
        desc = 'Find using Telescope 🔭 and Ag  ',
      },
    },
  },
  {
    'jvgrootveld/telescope-zoxide',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
    opts = {},
    keys = {
      {
        '<leader>tz',
        ':Telescope zoxide list<cr>',
        'n',
        desc = 'Search Zoxide using Telescope 🔭',
      },
    },
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    config = function()
      require('telescope').load_extension('undo')
    end,
    keys = {
      {
        '<leader>tu',
        ':Telescope undo<cr>',
        'n',
        desc = 'Search undo history w/ Telescope 🔭',
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
    config = function()
      require('telescope').load_extension('ui-select')
    end,
  },
  {
    'tsakirist/telescope-lazy.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      theme = 'ivy',
      show_icon = true,
    },
    init = function()
      require('telescope').load_extension('lazy')
    end,
    keys = {
      {
        '<leader>fl',
        ':Telescope lazy<cr>',
        'n',
        desc = 'Search lazy plugins w/ Telescope 🔭',
      },
    },
  },
}
