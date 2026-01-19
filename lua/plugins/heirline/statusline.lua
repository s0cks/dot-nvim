local colors = require('theme.colors')
local components = require('plugins.heirline.components')

--- TODO(@s0cks):
--- * add encoding component
--- * add executor status component
--- * add lsp status component

local Scroll = {
  static = {
    states = {
      '\u{2801}', --- ⠁
      '\u{2803}', --- ⠃
      '\u{2807}', --- ⠇
      '\u{2847}', --- ⡇
      '\u{28C7}', --- ⣇
      '\u{28E7}', --- ⣧
      '\u{28F7}', --- ⣷
      '\u{28FF}', --- ⣿
    },
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.states) + 1
    return self.states[i]
  end,
  hl = { fg = colors['paper'] },
}

return {
  hl = colors['hl-bg'],
  components.Recording,
  components.Space,
  components.Mode,
  components.Space,
  components.Git,
  components.Space,

  components.Align,
  components.ExecutorStatus,

  components.Align,
  components.Pomodoro,
  components.LspStatus,
  components.Space,
  Scroll,
}
