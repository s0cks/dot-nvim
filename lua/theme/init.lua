---@return LazyPluginSpec
return {
  'kepano/flexoki-neovim',
  name = 'flexoki',
  priority = 1000,
  lazy = false,
  opts = {},
  init = function()
    vim.cmd([[colorscheme flexoki-dark]])
    local colors = require('theme.colors')
    local utils = require('theme.utils')
    utils.set_global_hl_fg('Identifier', colors['pu'])
  end,
}
