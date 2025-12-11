local c = require('flexoki.palette').palette()
return {
  init = function(self)
    self.line, self.column = unpack(vim.api.nvim_win_get_cursor(0))
  end,
  provider = function(self)
    return self.line .. ':' .. self.column
  end,
  update = 'CursorMoved',
}
