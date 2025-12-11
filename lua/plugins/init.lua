return {
  --- Nerdy
  --- NerdFont picker using snacks.nvim picker
  ---@url https://github.com/2kabhishek/nerdy.nvim
  ---@type LazyPluginSpec
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    event = 'VeryLazy',
    cmd = 'Nerdy',
    opts = {},
  },
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
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    opts = {},
    config = function() end,
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
  ---@url https://github.com/ThePrimeagen/harpoon
  ---@type LazyPluginSpec
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      mark_branch = true,
      tabline = true,
      tabline_prefix = '   ',
      tabline_suffix = '   ',
    },
    keys = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
        'n',
        desc = 'Add a 🔱 Harpoon Mark',
      },
      {
        '<leader>hf',
        ':Telescope harpoon marks<cr>',
        'n',
        desc = 'Browse 🔱 Harpoon Marks w/ 🔭 Telescope',
      },
    },
  },
  ---@url https://github.com/TobinPalmer/Tip.nvim
  ---@type LazyPluginSpec
  {
    'TobinPalmer/Tip.nvim',
    event = 'VimEnter',
    opts = {
      seconds = 5,
      title = '💡 Tip!',
      url = 'https://vtip.43z.one', -- 'https://vimiscool.tech/neotip',
    },
    init = function(_, opts)
      require('tip').setup(opts or {})
    end,
  },
  ---@url https://github.com/ellisonleao/carbon-now.nvim
  ---@type LazyPluginSpec
  {
    'ellisonleao/carbon-now.nvim',
    lazy = true,
    cmd = 'CarbonNow',
    opts = {
      base_url = 'https://carbon.now.sh/',
      options = {
        bg = 'gray',
        drop_shadow_blur = '68px',
        drop_shadow = false,
        drop_shadow_offset_y = '20px',
        font_family = 'Hack',
        font_size = '18px',
        line_height = '133%',
        line_numbers = true,
        theme = 'monokai',
        titlebar = 'Made with carbon-now.nvim',
        watermark = false,
        width = '680',
        window_theme = 'sharp',
        padding_horizontal = '0px',
        padding_vertical = '0px',
      },
    },
    keys = {
      {
        '<leader>cn',
        '<cmd>CarbonNow<cr>',
        'n',
        desc = 'Create snippet using carbon-now',
      },
    },
  },
  ---@url https://github.com/j-hui/fidget.nvim
  ---@type LazyPluginSpec
  {
    'j-hui/fidget.nvim',
    version = '*',
    dependencies = {},
    opts = {},
  },
  ---@url https://github.com/JohnnyJumper/neotypist.nvim
  ---@type LazyPluginSpec
  {
    'JohnnyJumper/neotypist.nvim',
    version = '*',
    event = 'VeryLazy',
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
  ---@url https://github.com/mikavilpas/yazi.nvim
  ---@type LazyPluginSpec
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    keys = {
      {
        '<leader>.',
        '<cmd>Yazi cwd<cr>',
        'n',
        desc = 'Open Yazi in the current working directory',
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  ---@url https://github.com/tris203/hawtkeys.nvim
  ---@type LazyPluginSpec
  {
    'tris203/hawtkeys.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      leader = ',',
      customMaps = {
        ['wk.register'] = {
          method = 'which_key',
        },
        ['lazy'] = {
          method = 'lazy',
        },
      },
    },
  },
  ---@url https://github.com/folke/persistence.nvim
  ---@type LazyPluginSpec
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {
      dir = vim.fn.stdpath('state') .. '/sessions/',
      need = 1,
      branch = true,
    },
    keys = {
      {
        '<leader>qs',
        function()
          require('persistence').load()
        end,
        'n',
        desc = 'Load the session for the current directory',
      },
      {
        '<leader>qS',
        function()
          require('persistence').select()
        end,
        'n',
        desc = 'Select a session to load',
      },
      {
        '<leader>ql',
        function()
          require('persistence').load({ last = true })
        end,
        'n',
        desc = 'Load the last session',
      },
      {
        '<leader>qd',
        function()
          require('persistence').stop()
        end,
        'n',
        desc = 'Stop persistence, session wont be saved',
      },
    },
  },
  ---@url https://github.com/NitroVim/foldergen.nvim
  ---@type LazyPluginSpec
  {
    'NitroVim/foldergen.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>gf',
        ':FolderGen<cr>',
        'n',
        desc = 'Generate folder structure from text',
      },
    },
    config = function()
      vim.api.nvim_create_user_command('FolderGen', function()
        require('foldergen').generate_from_text()
      end, {})
    end,
  },
}
