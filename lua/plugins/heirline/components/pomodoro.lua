return {
  init = function(self)
    ---TODO(@s0cks): implement
  end,
  update = function()
    return vim.fn.localtime() % 2 == 0
  end,
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
