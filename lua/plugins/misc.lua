return {
  ---@type LazyPluginSpec
  {
    'm-demare/hlargs.nvim',
    version = '*',
    event = 'VeryLazy',
  },
  {
    'gisketch/triforce.nvim',
    dependencies = {
      'nvzone/volt',
    },
    opts = {
      notifications = {
        enabled = false,
      },
      keymap = {
        show_profile = '<leader>tri', -- Open profile with <leader>tp
      },
    },
  },
  {
    'uga-rosa/ccc.nvim',
    cmd = {
      'CccPick',
      'CccConvert',
      'CccHighlighterToggle',
      'CccHighlighterEnable',
      'CccHighlighterDisable',
    },
    opts = {},
  },
  {
    'XXiaoA/atone.nvim',
    cmd = 'Atone',
    opts = {},
    keys = {
      {
        '<leader>U',
        '<cmd>Atone toggle<cr>',
        'n',
        desc = 'Toggle the undo  tree',
      },
    },
  },
  ---@type LazyPluginSpec
  {
    'windwp/nvim-autopairs',
    version = '*',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'gregorias/coerce.nvim',
    tag = 'v4.1.0',
    config = true,
  },
  --- minty color utils
  ---@type LazyPluginSpec
  {
    'nvzone/minty',
    cmd = { 'Shades', 'Huefy' },
    dependencies = {
      { 'nvzone/volt', lazy = true },
    },
    opts = {},
  },
  --- Taskfile plugin
  ---@type LazyPluginSpec
  {
    's0cks/taskfile.nvim',
    opts = {},
    config = function(_, opts)
      require('taskfile').setup(opts or {})
      --- TODO(@s0cks): implement
    end,
  },
  ---@url https://github.com/jsongerber/thanks.nvim
  ---@type LazyPluginSpec
  {
    'jsongerber/thanks.nvim',
    opts = {
      star_on_install = true,
      star_on_startup = false,
      ignore_repos = {},
      ignore_authors = {},
      unstar_on_uninstall = false,
      ask_before_unstarring = false,
      ignore_unauthenticated = false,
    },
  },
  --- Tip - Neovim launch tip greeter
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
  },
  ---@type LazyPluginSpec
  {
    'zbirenbaum/neodim',
    event = 'LspAttach',
    opts = {},
  },
}
