return {
  'aznhe21/actions-preview.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    's0cks/flexoki.nvim',
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
  keys = {},
}
