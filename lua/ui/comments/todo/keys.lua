return {
  {
    ']t',
    function()
      require('todo-comments').jump_next()
    end,
    'n',
    { desc = 'Next TODO' },
  },
  {
    '[t',
    function()
      require('todo-comments').jump_previous()
    end,
    'n',
    { desc = 'Previous TODO' },
  },
}
