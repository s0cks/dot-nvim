local colors = require('theme.colors')

local M = {}
M.colors = colors

---@param name string The name of the highlight
---@param hl vim.api.keyset.highlight
local function set_global_hl(name, hl)
  vim.api.nvim_set_hl(0, name, hl)
end

function M.setup()
  set_global_hl('Identifier', {
    fg = colors['pu'],
  })
end

return M
