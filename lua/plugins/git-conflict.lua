return {
  'akinsho/git-conflict.nvim',
  version = '*',
  cmd = 'GitConflictListQf',
  keys = {
    {
      '<leader>Gcq',
      '<cmd>GitConflictListQf<cr>',
      'n',
      desc = 'Open git conflict quickfix list',
    },
  },
  opts = {
    default_mappings = {
      ours = 'o',
      theirs = 't',
      none = '0',
      both = 'b',
      next = 'n',
      prev = 'p',
    },
  },
}
