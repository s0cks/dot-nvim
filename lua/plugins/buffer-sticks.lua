return {
  'ahkohd/buffer-sticks.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader> ',
      function()
        BufferSticks.jump()
      end,
      desc = 'Jump to buffer',
    },
    {
      '<leader>q ',
      function()
        BufferSticks.close()
      end,
      desc = 'Close buffer',
    },
  },
  opts = function()
    local c = require('flexoki.palette').palette()
    return {
      transparent = true,
      auto_hide = true,
      offset = { x = 0, y = 0 },
      padding = { top = 0, right = 1, bottom = 0, left = 1 },
      preview = {
        enabled = true,
        mode = 'current',
        float = {
          position = 'below',
          width = 0.5,
          height = 0.8,
          border = 'single',
          tittle_pos = 'right',
        },
      },
      list = {
        show = {
          'filename',
          'space',
          'label',
        },
        active_indicator = '',
        keys = {
          close_buffer = '<C-q>',
          move_up = '<C-k>',
          move_down = '<C-j>',
        },
      },
      filter = {
        buftypes = {
          'terminal',
        },
        filetypes = {
          'help',
          'qf',
        },
        names = {
          '.*%.git/.*',
          '^/tmp/.*',
        },
      },
      highlights = {
        active = c['hl-ma'],
        alternate = c['hl-tx3'],
        inactive = c['hl-tx3'],
        active_modified = c['hl-tx3'],
        alternate_modified = c['hl-tx3'],
        inactive_modified = c['hl-tx3'],
        label = c['hl-tx-italic'],
        filter_selected = c['hl-pu-italic'],
        filter_title = c['hl-tx-italic'],
        list_selected = c['hl-pu-italic'],
      },
    }
  end,
  init = function()
    require('buffer-sticks').show()
  end,
}
