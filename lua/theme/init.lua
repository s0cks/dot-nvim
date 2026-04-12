---@return LazyPluginSpec
return {
  's0cks/flexoki.nvim',
  name = 'flexoki',
  priority = 1000,
  lazy = false,
  opts = {},
  init = function()
    vim.cmd([[colorscheme flexoki-dark]])
  end,
}
