return {
  {
    '<leader>u',
    function()
      require('undotree').toggle()
    end,
    { 'n', 'v' },
    { desc = 'Toggle undo tree' },
  },
}
