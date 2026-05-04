return {
  init = function(self)
    ---TODO(@s0cks): implement
  end,
  condition = function()
    local pomo = require('pomodoro')
    return pomo.phase ~= 0
  end,
  update = function()
    return vim.fn.localtime() % 2 == 0
  end,
  provider = function()
    return require('pomodoro').get_pomodoro_status("X🍅","🍅","☕")
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['re'],
      bold = true,
    }
  end,
}
