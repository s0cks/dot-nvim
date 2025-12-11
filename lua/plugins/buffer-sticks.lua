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
    {
      '<leader>bq',
      function()
        BufferSticks.close()
      end,
      desc = 'Close buffer',
    },
    {
      '<leader>bp',
      function()
        BufferSticks.list({
          action = function(buffer, leave)
            print('selected: ' .. buffer.name)
            leave()
          end,
        })
      end,
      desc = 'Pick buffer',
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
