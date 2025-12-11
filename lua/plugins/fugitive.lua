---@type LazyPluginSpec
return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  opts = {},
  config = function() end,
  keys = {
    {
      '<leader>Gp',
      ':Git push',
      'n',
      desc = 'Git push',
    },
  },
}
