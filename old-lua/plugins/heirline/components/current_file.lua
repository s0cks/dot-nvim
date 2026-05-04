local colors = require('theme.colors')

local FileIconComponent = {
  init = function(self)
    local icons = require('theme.icons')
    self.icon = icons.get(self.extension)
  end,
  provider = function(self)
    return self.icon and (self.icon .. ' ')
  end,
}

local FileNameComponent = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ':.')
    if filename == '' then
      return '[None]'
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
    if self.filename then
      self.extension = vim.fn.fnamemodify(self.filename, ':e')
    end
  end,
  cond = function(self)
    return self.filename ~= nil
  end,
  update = 'BufEnter',
  FileIconComponent,
  basic_components.Space,
  FileNameComponent,
}
