return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  dependencies = {
    'kepano/flexoki-neovim',
    'nvim-tree/nvim-web-devicons',
    'rachartier/tiny-devicons-auto-colors.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = require('plugins.whichkey.config'),
  init = function()
    require('theme.utils').set_global_hl_fg({
      WhichKeyNormal = 'bg',
      WhichKeyIconAzure = 'bl',
      WhichKeyIconBlue = 'bl',
      WhichKeyIconCyan = 'cy',
      WhichKeyIconGreen = 'gr',
      WhichKeyIconGrey = 'tx-2',
      WhichKeyIconOrange = 'or',
      WhichKeyIconPurple = 'pu',
      WhichKeyIconRed = 're',
      WhichKeyIconYellow = 'ye',
      WhichKeyDesc = 'tx',
    })
  end,
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({
          global = false,
        })
      end,
      desc = 'Open which-key',
    },
  },
}
