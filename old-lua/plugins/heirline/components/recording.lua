local RecordingIndicator = {
  provider = function()
    return ''
  end,
  hl = function()
    return require('theme.colors')['hl-alert']
  end,
}

local basic_components = require('plugins.heirline.components.basic')
local Space = basic_components.Space

return {
  condition = function()
    return vim.fn.reg_recording() ~= ''
  end,
  update = {
    'RecordingEnter',
    'RecordingLeave',
  },
  Space,
  RecordingIndicator,
}
