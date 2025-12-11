return {
  'soemre/commentless.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = 'Commentless',
  keys = require('ui.comments.commentless.keys'),
  opts = require('ui.comments.commentless.config'),
}
