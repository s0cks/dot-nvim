return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  opts = function()
    local c = require('flexoki.palette').palette()
    return {
      preset = 'helix',
      triggers = {
        { '<auto>', mode = 'nixsotc' },
        { 'a', mode = { 'n', 'v' } },
      },
      icons = {
        rules = {
          { pattern = 'python', icon = '', color = 'green' },
          { pattern = 'nodejs', icon = '', color = 'green' },
          { pattern = 'terminal', icon = '', color = 'white' },
          { pattern = 'lua', icon = '', color = 'blue' },
          { pattern = 'ruby', icon = '', color = 'red' },
        },
      },
    }
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
