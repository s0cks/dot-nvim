local M = {}
local colors = require('theme.colors')

local DEFAULT_TELESCOPE_WINBLEND = 40
function M.get_telescope_theme(opts)
  return vim.tbl_extend(
    'force',
    require('telescope.themes').get_ivy({
      winblend = DEFAULT_TELESCOPE_WINBLEND,
    }),
    opts or {}
  )
end

---Utility for setting a global highlight
---@param name string The name of the highlight
---@param hl vim.api.keyset.highlight
function M.set_global_hl(name, hl)
  vim.api.nvim_set_hl(0, name, hl)
end

---Set a global highlight to the specified fg color
---@param name string|table The name of the highlight
---@param color? string The fg color of the highlight
function M.set_global_hl_fg(name, color)
  if type(name) == 'table' then
    for k, v in pairs(name) do
      vim.api.nvim_set_hl(0, k, {
        fg = colors[v] and colors[v] or v,
      })
    end

    return
  end

  return M.set_global_hl(name, {
    fg = colors[color] and colors[color] or color,
  })
end

---Set a global highlight to the specified bg color
---@param name string|table The name of the highlight
---@param color? string The bg color of the highlight
function M.set_global_hl_bg(name, color)
  if type(name) == 'table' then
    for k, v in pairs(name) do
      vim.api.nvim_set_hl(0, k, {
        bg = colors[v] and colors[v] or v,
      })
    end

    return
  end

  return M.set_global_hl(name, {
    bg = colors[color] and colors[color] or color,
  })
end

---Set a global highlight to the specified fg color w/ bolding
---@param name string The name of the highlight
---@param color string The color of the highlight
function M.set_global_hl_fg_bold(name, color)
  if type(name) == 'table' then
    for k, v in pairs(name) do
      vim.api.nvim_set_hl(0, k, {
        fg = colors[v] and colors[v] or v,
        bold = true,
      })
    end

    return
  end

  return M.set_global_hl(name, {
    fg = colors[color] and colors[color] or color,
    bold = true,
  })
end

return M
