--- Fidget - UI Framework for progress & notifications
---@url https://github.com/j-hui/fidget.nvim
---@type LazyPluginSpec
return {
  'j-hui/fidget.nvim',
  version = '1.6.1',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  init = function()
    require('telescope').load_extension('fidget')
  end,
}
