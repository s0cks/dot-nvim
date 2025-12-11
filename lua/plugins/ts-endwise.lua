---@type LazyPluginSpec
return {
  'RRethy/nvim-treesitter-endwise',
  version = '*',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'VeryLazy',
}
