local colors = require('theme.colors')
local components = require('plugins.heirline.components')

--- TODO(@s0cks):
--- * add encoding component
--- * add executor status component
--- * add lsp status component

return {
  hl = {
    bg = colors['bg'],
  },
  components.Space,
  components.Mode,
  components.Space,
  components.Git,
  components.ExecutorStatus,
  components.Align,
  components.Pomodoro,
  components.LspStatus,
}
