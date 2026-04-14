local leader = ','
local button = require('plugins.alpha.button')

return {
  type = 'group',
  val = {
    button('e', '  New file', '<cmd>ene <CR>'),
    button(leader .. 'ff', '󰈞  Find file'),
    button(leader .. 'fgr', '󰈬  Find word'),
    button(leader .. 'fm', '  Jump to bookmarks'),
  },
  opts = {
    spacing = 1,
    position = 'center',
  },
}
