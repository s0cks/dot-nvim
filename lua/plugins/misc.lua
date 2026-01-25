return {
  ---@type LazyPluginSpec
  {
    'm-demare/hlargs.nvim',
    version = '*',
    event = 'VeryLazy',
  },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'tris203/precognition.nvim',
    event = 'VeryLazy',
    opts = {
      startVisible = false,
      showBlankVirtLine = false,
      highlightColor = { link = 'Comment' },
      disabled_fts = {
        'dashboard',
      },
    },
  },
  {
    'maelwalser/speed-motion.nvim',
    cmd = 'SpeedMotion',
    opts = {},
  },
  {
    '4DRIAN0RTIZ/complexity.nvim',
    cmd = 'ShowComplexity',
    opts = {
      thresholds = {
        low = 10, -- CCN <= low is considered low complexity
        medium = 15, -- CCN > low and <= medium is medium complexity
        -- CCN > medium is high complexity
      },
      virt_prefix = '⮕ Complexity:', -- text prefix for virtual text
      virt_pos = 'eol', -- extmark position ("eol" or "overlay")
    },
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
