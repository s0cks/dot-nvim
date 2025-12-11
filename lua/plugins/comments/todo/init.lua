--- TODO: @s0cks implement
return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = require('plugins.comments.todo.keys'),
  opts = require('plugins.comments.todo.config'),
}
