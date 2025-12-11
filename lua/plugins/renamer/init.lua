return {
  'filipdutescu/renamer.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = require('plugins.renamer.keys'),
  opts = require('plugins.renamer.config'),
}
