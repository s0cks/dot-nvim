return {
  'ahkohd/buffer-sticks.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>bj',
      function()
        BufferSticks.jump()
      end,
      desc = 'Jump to buffer',
    },
  },
  opts = {
    filter = {
      buftypes = {
        'terminal',
      },
    },
  },
  init = function()
    require('buffer-sticks').show()
  end,
}
