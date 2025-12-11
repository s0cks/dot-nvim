local M = {}

---Utility for setting a global highlight
---@param name string The name of the highlight
---@param hl vim.api.keyset.highlight
function M.set_global_hl(name, hl)
  vim.api.nvim_set_hl(0, name, hl)
end

---Set a global highlight to the specified fg color
---@param name string The name of the highlight
---@param color string The fg color of the highlight
function M.set_global_hl_fg(name, color)
  return M.set_global_hl(name, {
    fg = color,
  })
end

---Set a global highlight to the specified fg color w/ bolding
---@param name string The name of the highlight
---@param color string The color of the highlight
function M.set_global_hl_fg_bold(name, color)
  return M.set_global_hl(name, {
    fg = color,
    bold = true,
  })
end

return M
