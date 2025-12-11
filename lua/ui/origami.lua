---@url https://github.com/chrisgrieser/nvim-origami
---@type LazyPluginSpec
return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>fj',
      function()
        require('origami').h()
      end,
      { 'n', 'v' },
      desc = ' Fold line',
    },
    {
      '<leader>fk',
      function()
        require('origami').l()
      end,
      { 'n', 'v' },
      desc = ' Unfold line',
    },
    {
      '<leader>f$',
      function()
        require('origami').dollar()
      end,
      { 'n', 'v' },
      desc = ' Unfold line recursively',
    },
  },
  opts = {
    foldKeymaps = {
      setup = false,
    },
  }, -- needed even when using default config
  init = function() end,
}
