---@url https://github.com/folke/persistence.nvim
---@type LazyPluginSpec
return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    dir = vim.fn.stdpath('state') .. '/sessions/',
    need = 1,
    branch = true,
  },
  keys = {
    {
      '<leader>qs',
      function()
        require('persistence').load()
      end,
      'n',
      desc = 'Load the session for the current directory',
    },
    {
      '<leader>qS',
      function()
        require('persistence').select()
      end,
      'n',
      desc = 'Select a session to load',
    },
    {
      '<leader>ql',
      function()
        require('persistence').load({ last = true })
      end,
      'n',
      desc = 'Load the last session',
    },
    {
      '<leader>qd',
      function()
        require('persistence').stop()
      end,
      'n',
      desc = 'Stop persistence, session wont be saved',
    },
  },
}
