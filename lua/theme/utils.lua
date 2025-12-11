local M = {}

---@param name string The name of the highlight
---@param hl vim.api.keyset.highlight
function M.set_global_hl(name, hl)
  vim.api.nvim_set_hl(0, name, hl)
end

---@param name string The name of the highlight
---@param color string The fg color of the highlight
function M.set_global_hl_fg(name, color)
  return M.set_global_hl(name, {
    fg = color,
  })
end

return M
