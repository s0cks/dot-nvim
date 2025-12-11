return {
  {
    'folke/edgy.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = 'screen'
    end,
  },
}
