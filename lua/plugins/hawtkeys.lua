---@type LazyPluginSpec
return {
  'tris203/hawtkeys.nvim',
  cmd = 'Hawtkeys',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    leader = ',',
    customMaps = {
      ['wk.register'] = {
        method = 'which_key',
      },
      ['lazy'] = {
        method = 'lazy',
      },
    },
  },
}
