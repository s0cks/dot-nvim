local function create_default_opts()
  return {
    colors = require('catppuccin.palettes').get_palette('mocha'),
  }
end

local function config(_, opts)
  require('tiny-devicons-auto-colors').setup(vim.tbl_deep_extend('force', create_default_opts(), opts))
end

return {
  {
    'nvim-tree/nvim-web-devicons',
    config = true,
    lazy = false,
    priority = 1000,
    opts = {
      color_icons = true,
      default = true,
    },
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = config,
  },
}
