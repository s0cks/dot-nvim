return {
  {
    ---@url https://github.com/danymat/neogen
    ---@type LazyPluginSpec
    'danymat/neogen',
    version = '*',
    event = 'VeryLazy',
    opts = require('plugins.neogen.config'),
    keys = require('plugins.neogen.keys'),
  },
}
