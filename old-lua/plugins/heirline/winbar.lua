local c = require('theme.colors')
local components = require('plugins.heirline.components')

return {
  hl = {
    bg = c['bg'],
  },
  fallthrough = false,
  --- default winbar
  {
    components.CurrentFile,
    components.Align,
    components.Diagnostics,
  },
}
