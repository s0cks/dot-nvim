---@return LazyPluginSpec
return {
  'nvim-neotest/neotest',
  version = '*',
  dependencies = {
    --- required
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    --- optional
    'nvim-treesitter/nvim-treesitter',
    --- adapters
    'alfaix/neotest-gtest',
  },
  opts = {
    adapters = {
      require('neotest-gtest').setup({}),
    },
  },
}
