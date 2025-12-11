return {
  {
    'zu',
    function()
      require('agrolens.fzf').run({
        query = 'functions,labels',
        buffers = 'all',
        same_type = false,
      })
    end,
    'n',
    { desc = 'Find: Functions & Labels' },
  },
}
