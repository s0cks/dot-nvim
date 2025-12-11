return {
  {
    '<leader>zm',
    function()
      Snacks.zen()
    end,
    { desc = 'Toggle Zen Mode' },
  },
  {
    '<leader>.',
    function()
      Snacks.scratch()
    end,
    'n',
    desc = 'Toggle scratch buffer',
  },
  {
    '<leader>S',
    function()
      Snacks.scratch.select()
    end,
    'n',
    desc = 'Select scratch buffer',
  },
  {
    '<leader>to',
    function() end,
    'n',
    desc = 'Open toggles',
  },
}
