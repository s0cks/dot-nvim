---@type LazyPluginSpec
return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  opts = {},
  config = function(_, opts)
    require('rainbow-delimiters.setup').setup(opts)
  end,
  init = function()
    local utils = require('theme.utils')
    local c = require('flexoki.palette').palette()
    utils.set_global_hl_fg({
      RainbowDelimiterRed = c['re'],
      RainbowDelimiterYellow = c['ye'],
      RainbowDelimiterBlue = c['bl'],
      RainbowDelimiterOrange = c['or'],
      RainbowDelimiterGreen = c['gr'],
      RainbowDelimiterViolet = c['pu'],
      RainbowDelimiterCyan = c['cy'],
    })
  end,
}
