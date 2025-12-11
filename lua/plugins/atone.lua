return {
  'XXiaoA/atone.nvim',
  cmd = 'Atone',
  opts = {}, -- your configuration here
  keys = {
    {
      '<leader>U',
      ':Atone toggle<cr>',
      'n',
      desc = 'Toggle undo tree',
    },
  },
}
