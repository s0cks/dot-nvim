local ReadingTime = {
  update = {
    'BufWrite',
  },
  --- TODO(@s0cks): check filetype
  -- condition = function()
  --   return true
  -- end,
  init = function(self)
    self.count = string.sub(require('nvim-prose').reading_time(), 1, -2)
  end,
  provider = function(self)
    return self.count .. 'm'
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['tx'],
      bold = true,
    }
  end,
}

local WordCount = {
  update = {
    'BufWrite',
  },
  --- TODO(@s0cks): check filetype
  -- condition = function()
  --   return true
  -- end,
  init = function(self)
    self.count = string.sub(require('nvim-prose').word_count(), 1, -2)
  end,
  provider = function(self)
    return self.count .. 'w'
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['tx'],
      bold = true,
    }
  end,
}
local basic = require('plugins.heirline.components.basic')

return {
  WordCount,
  basic.Space,
  ReadingTime,
  basic.Space,
}
