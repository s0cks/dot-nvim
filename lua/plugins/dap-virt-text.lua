---@type LazyPluginSpec
return {
  'theHamsta/nvim-dap-virtual-text',
  version = '*',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'VeryLazy',
  opts = {},
}
