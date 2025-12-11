---@type LazyPluginSpec
return {
  'alanfortlink/blackjack.nvim',
  event = 'VeryLazy',
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
}
