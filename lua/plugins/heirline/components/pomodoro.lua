return {
  init = function(self)
    ---TODO(@s0cks): implement
  end,
  update = {
    'User',
    pattern = 'GitSignsUpdate',
    callback = vim.schedule_wrap(function()
      vim.cmd([[redrawstatus]])
    end),
  },
  provider = function()
    return require('pomodoro').get_pomodoro_status('no tomato', 'tomato', 'break')
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['re'],
      bold = true,
    }
  end,
}
