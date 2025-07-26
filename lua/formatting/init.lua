return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = require('formatting.keys'),
    opts = require('formatting.config'),
    init = function()
      local util = require('formatting.util')
      vim.api.nvim_create_user_command('Format', util.format_current_buffer, { desc = ' Format current buffer' })
    end,
  },
}
