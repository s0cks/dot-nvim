local M = {}

function M.set_global_hl(name, hl)
  vim.api.nvim_set_hl(0, name, hl)
end

function M.set_global_hl_fg(name, color)
  return M.set_global_hl(name, {
    fg = color,
  })
end

return M
