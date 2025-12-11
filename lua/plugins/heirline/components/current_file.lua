local conditions = require('heirline.conditions')
local colors = require('theme.colors')

local M = {}

local FileIconComponent = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ':e')
    self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. ' ')
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local FileNameComponent = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ':.')
    if filename == '' then
      return '[None]'
    end

    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = function()
    if vim.bo.modified then
      return {
        fg = colors['pu'],
        bold = true,
      }
    end
    return { fg = colors['tx'] }
  end,
}

local basic_components = require('plugins.heirline.components.basic')
return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  end,
  update = 'BufEnter',
  FileIconComponent,
  basic_components.Space,
  FileNameComponent,
}
