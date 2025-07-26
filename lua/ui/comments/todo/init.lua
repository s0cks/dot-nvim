--- TODO: @s0cks implement
return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = require('ui.comments.todo.keys'),
  opts = require('ui.comments.todo.config'),
}
