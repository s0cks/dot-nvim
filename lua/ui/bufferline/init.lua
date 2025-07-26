return {
  'akinsho/bufferline.nvim',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {},
  config = function(_, opts)
    if (vim.g.colors_name or ''):find('catppuccin') then
      vim.opts.highlights = require('catppuccin.groups.integrations.bufferline').get()
    end
    require('akinsho/bufferline.nvim').setup(opts)
  end,
}
