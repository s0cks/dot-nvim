return {
  'filipdutescu/renamer.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader>rn',
      function()
        require('renamer').rename()
      end,
      { 'n', 'v' },
      {
        noremap = true,
        silent = true,
        desc = 'Rename',
      },
    },
  },
  opts = {},
}
