---@type LazyPluginSpec
return {
  'kawre/leetcode.nvim',
  cmd = 'Leet',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
}
