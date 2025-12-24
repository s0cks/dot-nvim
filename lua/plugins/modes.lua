return {
  'mvllow/modes.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  opts = function()
    local colors = require('theme.colors')
    return {
      colors = {
        bg = '', -- Optional bg param, defaults to Normal hl group
        copy = '#f5c359',
        delete = '#c75c6a',
        change = '#c75c6a', -- Optional param, defaults to delete
        format = '#c79585',
        insert = '#78ccc5',
        replace = '#245361',
        select = colors['pu'], -- Optional param, defaults to visual
        visual = colors['pu'],
      },
      -- Set opacity for cursorline and number background
      line_opacity = 0.65,

      -- Enable cursor highlights
      set_cursor = true,

      -- Enable cursorline initially, and disable cursorline for inactive windows
      -- or ignored filetypes
      set_cursorline = true,

      -- Enable line number highlights to match cursorline
      set_number = true,

      -- Enable sign column highlights to match cursorline
      set_signcolumn = true,

      -- Disable modes highlights for specified filetypes
      -- or enable with prefix "!" if otherwise disabled (please PR common patterns)
      -- Can also be a function fun():boolean that disables modes highlights when true
      ignore = { 'NvimTree', 'TelescopePrompt', '!minifiles' },
    }
  end,
}
