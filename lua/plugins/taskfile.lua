return {
  's0cks/taskfile.nvim',
  opts = {},
  config = function(_, opts)
    require('taskfile').setup(opts or {})
    --- TODO(@s0cks): implement
  end,
}
