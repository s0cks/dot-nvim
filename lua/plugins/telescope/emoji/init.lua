return {
  'allaman/emoji.nvim',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
    'saghen/blink.compat',
  },
  opts = {
    enable_cmp_integration = true,
  },
  keys = require('plugins.telescope.emoji.keys'),
  init = function()
    require('telescope').load_extension('emoji')
  end,
}
