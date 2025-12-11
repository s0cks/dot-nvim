return {
  'yorickpeterse/nvim-window',
  keys = {
    {
      '<leader>wj',
      "<cmd>lua require('nvim-window').pick()<cr>",
      'n',
      desc = 'nvim-window: Jump to window',
    },
  },
  opts = {
    render = 'status',
  },
}
