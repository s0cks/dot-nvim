return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  opts = function()
    return {
      preset = 'helix',
      triggers = {
        { '<auto>', mode = 'nixsotc' },
        { 'a', mode = { 'n', 'v' } },
      },
      icons = {
        rules = {
          { pattern = 'python', icon = '', color = 'green' },
          { pattern = 'node', icon = '', color = 'green' },
          { pattern = 'nodejs', icon = '', color = 'green' },
          { pattern = 'terminal', icon = '', color = 'white' },
          { pattern = 'lua', icon = '', color = 'blue' },
          { pattern = 'ruby', icon = '', color = 'red' },
        },
      },
    }
  end,
  init = function()
    local colors = require('theme.colors')
    local utils = require('theme.utils')
    utils.set_global_hl_fg('WhichKeyIconGreen', colors['gr'])
    utils.set_global_hl_fg('WhichKeyIconBlue', colors['bl'])
    utils.set_global_hl_fg('WhichKeyIconCyan', colors['cy'])
    utils.set_global_hl_fg('WhichKeyIconOrange', colors['or'])
    utils.set_global_hl_fg('WhichKeyIconPurple', colors['pu'])
    utils.set_global_hl_fg('WhichKeyIconRed', colors['re'])
    utils.set_global_hl_fg('WhichKeyIconYellow', colors['ye'])
  end,
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Open which-key',
    },
  },
}
