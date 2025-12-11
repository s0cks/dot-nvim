local conditions = require('heirline.conditions')
local colors = require('theme.colors')

local GitHeadComponent = {
  provider = function(self)
    return ' ' .. self.current_branch
  end,
  condition = function(self)
    return self.current_branch
  end,
  hl = { fg = colors['or'] },
}

local GitChangesComponent = function(name, symbol, color)
  return {
    provider = function(self)
      return symbol .. self.status_dict[name]
    end,
    condition = function(self)
      return self.status_dict and self.status_dict[name] and (self.status_dict[name] ~= 0)
    end,
    hl = { fg = color },
  }
end

local basic_components = require('plugins.heirline.components.basic')
return {
  init = function(self)
    self.status_dict = vim.b[vim.api.nvim_get_current_buf()].gitsigns_status_dict
    self.current_branch = vim.b[vim.api.nvim_get_current_buf()].gitsigns_head
  end,
  update = {
    'User',
    pattern = 'GitSignsUpdate',
    callback = vim.schedule_wrap(function()
      vim.cmd([[redrawstatus]])
    end),
  },
  GitHeadComponent,
  basic_components.Space,
  GitChangesComponent('added', '+', colors['gr']),
  GitChangesComponent('removed', '-', colors['re']),
  GitChangesComponent('changed', '~', colors['pu']),
}
