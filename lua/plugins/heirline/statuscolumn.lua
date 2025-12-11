local function ConstantProvider(value)
  return { provider = value }
end

local Space = ConstantProvider(' ')
local Align = ConstantProvider('%=')

local BufferNumberComponent = {
  init = function(self)
    self.value = vim.api.nvim_get_current_buf()
  end,
  provider = function(self)
    return self.value
  end,
  hl = function(self)
    return { fg = 'white' }
  end,
}

return {
  BufferNumberComponent,
}
