return {
  {
    '<leader>rn',
    function()
      require('renamer').rename()
    end,
    { 'n', 'v' },
    {
      noremap = true,
      silent = true,
      desc = 'Rename',
    },
  },
}
