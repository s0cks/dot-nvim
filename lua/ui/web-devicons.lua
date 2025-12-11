local function get_colors()
  local c = require('flexoki.palette').palette()
  return {
    c['tx'],
    c['bg'],
    c['re'],
    c['ye'],
    c['gr'],
    c['pu'],
    c['ma'],
    c['cy'],
    c['bl'],
    c['or'],
  }
end

local function get_default_opts()
  return {
    colors = get_colors(),
  }
end

return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    priority = 1000,
    opts = {
      color_icons = true,
      default = true,
    },
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'kepano/flexoki-neovim',
    },
    config = function(_, opts)
      require('tiny-devicons-auto-colors').setup(vim.tbl_deep_extend('force', get_default_opts(), opts or {}))
    end,
  },
}
