return {
  'aznhe21/actions-preview.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'kepano/flexoki-neovim',
  },
  opts = {
    backend = {
      'telescope',
      'snacks',
      'nui',
    },
    telescope = require('theme.utils').get_telescope_theme({
      make_value = nil,
      make_make_display = nil,
    }),
    snacks = {
      layout = {
        preset = 'default',
      },
    },
  },
  keys = {
    {
      'gf',
      function()
        require('actions-preview').code_actions()
      end,
      { 'n', 'v' },
      desc = 'Preview actions',
    },
  },
}
