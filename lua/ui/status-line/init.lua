return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function(_, opts)
    local config = vim.tbl_deep_extend('force', opts.line or {}, require('ui.status-line.config'))
    require('lualine').setup(config)
  end,
}
