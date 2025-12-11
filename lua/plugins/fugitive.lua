---@type LazyPluginSpec
return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  opts = {},
  config = function() end,
  keys = {
    {
      '<leader>Gp',
      ':Git push<CR>',
      'n',
      desc = 'Git push',
    },
  },
}
