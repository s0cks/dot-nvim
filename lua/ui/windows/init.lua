return {
  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'WinLeave',
    config = true,
    {},
  },
  {
    'yorickpeterse/nvim-window',
    keys = {
      {
        '<leader>wj',
        "<cmd>lua require('nvim-window').pick()<cr>",
        { desc = 'nvim-window: Jump to window' },
      },
    },
    opts = {
      render = 'status',
    },
  },
}
