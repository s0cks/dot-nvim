return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'kepano/flexoki-neovim',
  },
  event = 'VeryLazy',
  opts = require('ui.lualine.config'),
}
