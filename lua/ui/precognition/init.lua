return {
  {
    'tris203/precognition.nvim',
    event = 'VeryLazy',
    opts = {
      showBlankVirtLine = false,
      highlightColor = { link = 'Comment' },
      disabled_fts = {
        'dashboard',
      },
    },
    config = function(_, opts)
      local precognition = require('precognition')
      precognition.config(opts or {})
      precognition.hide()
    end,
  },
}
