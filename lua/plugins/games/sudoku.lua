local function generate_custom_highlights()
  local palette = require('catppuccin.palettes').get_palette('mocha')
  return {
    board = { fg = palette.base },
    number = { fg = palette.text, bg = palette.base },
    active_menu = { fg = palette.text, bg = palette.base, gui = 'bold' },
    hint_cell = { fg = palette.text, bg = palette.overlay2 },
    square = { bg = palette.surface0, fg = palette.text },
    column = { bg = palette.surface0, fg = palette.overlay0 },
    row = { bg = palette.surface0, fg = palette.overlay0 },
    settings_disabled = { fg = palette.overlay1, gui = 'italic' },
    same_number = { fg = palette.text, gui = 'bold' },
    set_number = { fg = palette.text, gui = 'italic' },
    error = { fg = palette.red, bg = palette.surface0 },
  }
end

---@type LazyPluginSpec
return {
  'jim-fx/sudoku.nvim',
  event = 'VeryLazy',
  version = '*',
  dependencies = {
    'catppuccin/nvim',
  },
  cmd = 'Sudoku',
  opts = {
    custom_highlights = generate_custom_highlights(),
  },
}
