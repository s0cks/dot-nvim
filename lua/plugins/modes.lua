local hl_palette = {
  ModesCopy = 'ye',
  ModesDelete = 're',
  ModesFormat = 'or',
  ModesInsert = 'cy',
  ModesVisual = 'pu',
  ModesReplace = 'bl',
}

return {
  'mvllow/modes.nvim',
  version = '*',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  opts = {
    -- Set opacity for cursorline and number background
    line_opacity = 0.25,

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
  },
  init = function()
    local c = require('flexoki.palette').palette()
    local set_hl_bg = function(group, color)
      vim.api.nvim_set_hl(0, group, {
        bg = c[color] and c[color] or color,
      })
    end

    for group, color in pairs(hl_palette) do
      set_hl_bg(group, color)
    end
  end,
}
