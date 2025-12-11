---@url https://github.com/kawre/leetcode.nvim
---@type LazyPluginSpec
return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
}
