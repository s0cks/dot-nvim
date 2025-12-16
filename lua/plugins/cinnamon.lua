---@return LazyPluginSpec
return {
  'declancm/cinnamon.nvim',
  version = '*',
  opts = {
    keymaps = {
      basic = true,
      extra = true,
    },
    options = {
      mode = 'cursor',
    },
  },
}
