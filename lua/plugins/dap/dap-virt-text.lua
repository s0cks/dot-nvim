---@type LazyPluginSpec
return {
  'theHamsta/nvim-dap-virtual-text',
  version = '*',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  event = 'VeryLazy',
  opts = {},
}
