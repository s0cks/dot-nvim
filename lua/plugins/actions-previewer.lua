return {
  'aznhe21/actions-preview.nvim',
  opts = {
    backend = {
      'telescope',
      'snacks',
      'nui',
    },
    telescope = vim.tbl_extend('force', require('telescope.themes').get_dropdown(), {
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
