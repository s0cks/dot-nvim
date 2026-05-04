local conds = require('heirline.conditions')
return {
  condition = conds.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },
  provider = function()
    local names = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(names, client.name)
    end
    return ' ' .. table.concat(names, ' ')
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['gr'],
      bold = true,
    }
  end,
}
