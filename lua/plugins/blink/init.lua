return {
  ---@type LazyPluginSpec
  {
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
      'marcoSven/blink-cmp-yanky',
      --- theming
      'xzbdmw/colorful-menu.nvim',
    },
    version = '^1.*',
    opts = require('plugins.blink.config'),
    init = function()
      local colors = require('theme.colors')
      local utils = require('theme.utils')
      utils.set_global_hl_fg_bold('BlinkCmpKindYank', colors['pu'])
    end,
  },
  -- TODO(@s0cks): this is borked and keeps crashing
  -- {
  --   'saghen/blink.indent',
  --   --- @module 'blink.indent'
  --   --- @type blink.indent.Config
  --   dependencies = {
  --     'kepano/flexoki-neovim',
  --   },
  --   opts = {
  --     static = {
  --       enabled = false,
  --     },
  --     blocked = {
  --       -- default: 'terminal', 'quickfix', 'nofile', 'prompt'
  --       buftypes = { include_defaults = true },
  --       -- default: 'lspinfo', 'packer', 'checkhealth', 'help', 'man', 'gitcommit', 'dashboard', ''
  --       filetypes = { include_defaults = true },
  --     },
  --     scope = {
  --       enabled = true,
  --       highlights = {
  --         'BlinkIndentRed',
  --         'BlinkIndentOrange',
  --         'BlinkIndentYellow',
  --         'BlinkIndentGreen',
  --         'BlinkIndentCyan',
  --         'BlinkIndentBlue',
  --         'BlinkIndentViolet',
  --         'BlinkIdentMagenta',
  --       },
  --     },
  --   },
  --   init = function()
  --     local colors = require('theme.colors')
  --     local utils = require('theme.utils')
  --     utils.set_global_hl_fg('BlinkIdentRed', colors['re'])
  --     utils.set_global_hl_fg('BlinkIdentOrange', colors['or'])
  --     utils.set_global_hl_fg('BlinkIdentYellow', colors['ye'])
  --     utils.set_global_hl_fg('BlinkIdentGreen', colors['gr'])
  --     utils.set_global_hl_fg('BlinkIdentCyan', colors['cy'])
  --     utils.set_global_hl_fg('BlinkIdentBlue', colors['bl'])
  --     utils.set_global_hl_fg('BlinkIdentViolet', colors['pu'])
  --     utils.set_global_hl_fg('BlinkIdentMagenta', colors['ma'])
  --   end,
  -- },
}
