---@return LazyPluginSpec
return {
  'nvim-neotest/neotest',
  version = '*',
  dependencies = {
    --- required
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    --- adapters
    'alfaix/neotest-gtest',
  },
  ---TODO(@s0cks): integrate test adapters
  opts = {
    adapters = {},
  },
}
