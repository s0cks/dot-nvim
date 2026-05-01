return {
  ---@type LazyPluginSpec
  {
    'NStefan002/2048.nvim',
    cmd = 'Play2048',
    opts = {},
  },
  ---@type LazyPluginSpec
  {
    'alanfortlink/blackjack.nvim',
    cmd = 'BlackJackNewGame',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      card_style = 'mini',
      suit_style = 'black',
      scopes_path = vim.fn.stdpath('data') .. '/blackjack_scores.json',
      keybindings = {
        ['next'] = 'j',
        ['finish'] = 'k',
        ['quit'] = 'q',
      },
    },
  },
  ---@type LazyPluginSpec
  {
    'jim-fx/sudoku.nvim',
    cmd = 'Sudoku',
    version = '*',
    dependencies = {
      's0cks/flexoki.nvim',
    },
    opts = {
      -- TODO(@s0cks): fix highlights for theme
      -- custom_highlights = generate_custom_highlights(),
    },
  },
}
