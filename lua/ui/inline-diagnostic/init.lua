return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  dependencies = {
    'catppuccin/nvim',
  },
  config = function(_, opts)
    local config = vim.tbl_deep_extend('force', opts or {}, require('ui.inline-diagnostic.config'))
    require('tiny-inline-diagnostic').setup(config)
  end,
}
