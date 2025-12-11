return {
  ---@type LazyPluginSpec
  {
    'saghen/blink.compat',
    version = '2.*',
    lazy = true,
    opts = {},
  },
  ---@type LazyPluginSpec
  {
    'saghen/blink.cmp',
    dependencies = {
      'saghen/blink.compat',
      'rafamadriz/friendly-snippets',
      --- providers
      'bydlw98/blink-cmp-env',
      'Dynge/gitmoji.nvim',
      'allaman/emoji.nvim',
      'Kaiser-Yang/blink-cmp-git',
      'MahanRahmati/blink-nerdfont.nvim',
      --- theming
      'xzbdmw/colorful-menu.nvim',
    },
    version = '^1.*',
    opts = require('blink.config'),
    opts_extend = { 'sources.default' },
  },
}
