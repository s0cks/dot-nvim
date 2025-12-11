return {
  {
    'allaman/emoji.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
      'saghen/blink.compat',
    },
    opts = {
      enable_cmp_integration = true,
    },
    init = function()
      require('telescope').load_extension('emoji')
    end,
    keys = {
      {
        '<leader>fe',
        ':Telescope emoji<cr>',
        'n',
        { desc = 'Search for an emoji using Telescope 🔭' },
      },
    },
  },
}
