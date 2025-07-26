return {
  require('plugins.games.blackjack'),
  require('plugins.games.sudoku'),
  require('plugins.games.2048'),
  ---@type LazyPluginSpec
  {
    'alec-gibson/nvim-tetris',
    event = 'VeryLazy',
    opts = {},
    config = function() end,
  },
}
