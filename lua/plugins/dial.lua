return {
  {
    'monaqa/dial.nvim',
    version = '*',
    opts = {},
    config = function()
      local function manipulate(motion, mode)
        local delegate = require('dial.map').manipulate
        return function()
          delegate(motion, mode)
        end
      end

      local map = vim.keymap.set
      map('n', '<leader>I', manipulate('increment', 'normal'))
      map('n', '<leader>D', manipulate('decrement', 'normal'))
      map('v', '<leader>I', manipulate('increment', 'visual'))
      map('v', '<leader>D', manipulate('decrement', 'visual'))
    end,
  },
}
