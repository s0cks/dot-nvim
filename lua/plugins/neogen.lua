---@url https://github.com/danymat/neogen
---@type LazyPluginSpec
return {
  'danymat/neogen',
  version = '*',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>ng',
      function() end,
      { 'n', 'i' },
      'Neogen documentation',
    },
  },
}
