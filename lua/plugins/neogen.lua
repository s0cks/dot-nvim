---@author tazz
---@license MIT
return {
  'danymat/neogen',
  version = '*',
  cmd = 'Neogen',
  opts = {},
  keys = {
    {
      '<leader>ngf',
      function()
        require('neogen').generate({
          type = 'func',
        })
      end,
      'n',
      desc = 'Generate func docs using Neogen',
    },
    {
      '<leader>ngF',
      function()
        require('neogen').generate({
          type = 'file',
        })
      end,
      'n',
      desc = 'Generate file docs using Neogen',
    },
    {
      '<leader>ngc',
      function()
        require('neogen').generate({
          type = 'class',
        })
      end,
      'm',
      desc = 'Generate class docs using Neogen',
    },
    {
      '<leader>ngt',
      function()
        require('neogen').generate({
          type = 'type',
        })
      end,
      'n',
      desc = 'Generate type docs using Neogen',
    },
  },
}
