---@return LazyPluginSpec
return {
  's0cks/flexoki.nvim',
  name = 'flexoki',
  priority = 1000,
  lazy = false,
  opts = {},
  init = function()
    vim.cmd([[colorscheme flexoki-dark]])
    local palette = require('theme.colors')
    vim.api.nvim_set_hl(0, 'Search', { bg = palette['pu'] })
    vim.api.nvim_set_hl(0, 'IncSearch', { bg = palette['pu'] })
    vim.api.nvim_set_hl(0, 'CurSearch', { bg = palette['pu-2'] })
    require('highlights')()
  end,
}
