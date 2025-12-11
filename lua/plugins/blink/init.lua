return {
  ---@type LazyPluginSpec
  'saghen/blink.cmp',
  dependencies = {
    { 'saghen/blink.compat', version = '2.*' },
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',
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
  opts = require('plugins.blink.config'),
  opts_extend = { 'sources.default' },
}
