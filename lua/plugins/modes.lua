return {
  'mvllow/modes.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  oriority = 49,
  opts = function()
    local colors = require('theme.colors')
    return {
      colors = {
        bg = '', -- Optional bg param, defaults to Normal hl group
        copy = colors.yank,
        delete = colors.delete,
        change = colors.change, -- Optional param, defaults to delete
        format = colors.format,
        insert = colors.insert,
        replace = colors.replace,
        select = colors.visual,
        visual = colors.visual,
      },
      -- Set opacity for cursorline and number background
      line_opacity = 0.60,
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
