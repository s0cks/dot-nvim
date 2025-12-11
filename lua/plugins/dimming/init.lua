return {
  {
    'nvim-focus/focus.nvim',
    version = '*',
    opts = {
      commands = false,
    },
    config = true,
  },
  {
    'zbirenbaum/neodim',
    event = 'LspAttach',
    opts = {},
  },
  {
    'tadaa/vimade',
    event = 'VeryLazy',
    opts = {
      recipe = {
        'default',
        { animate = true },
      },
      nohlcheck = true,
    },
  },
  {
    'folke/twilight.nvim',
    opts = {},
  },
}
