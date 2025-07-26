return {
  {
    'jiaoshijie/undotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = require('plugins.undotree.keys'),
    opts = require('plugins.undotree.config'),
  },
}
