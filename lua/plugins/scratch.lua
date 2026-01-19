return {
  'LintaoAmons/scratch.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
  },
  opts = {
    file_picker = 'telescope',
  },
  keys = {
    {
      '<leader>s',
      '<cmd>Scratch<cr>',
      'n',
      desc = 'Create and open a new scratch file',
    },
    {
      '<leader>so',
      '<cmd>ScratchOpen<cr>',
      'n',
      desc = 'Open a scratch file',
    },
  },
}
