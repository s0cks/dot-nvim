---@type LazyPluginSpec
return {
  'rebelot/heirline.nvim',
  version = '*',
  dependencies = {
    's0cks/flexoki.nvim',
    'lewis6991/gitsigns.nvim',
    'quentingruber/pomodoro.nvim',
    'yamatsum/nvim-nonicons',
    'skwee357/nvim-prose',
  },
  opts = function()
    return {
      statusline = require('plugins.heirline.statusline'),
      winbar = require('plugins.heirline.winbar'),
      opts = {
        disable_winbar_cb = function(args)
          local conditions = require('heirline.conditions')
          return conditions.buffer_matches({
            buftype = {
              'nofile',
              'prompt',
              'help',
              'quickfix',
            },
            filetype = {
              '^git.*',
              'fugitive',
              'Trouble',
              'dashboard',
              'TelescopePrompt',
              'yazi',
              'snacks_terminal',
            },
          }, args.buf)
        end,
      },
    }
  end,
  init = function()
    local colors = require('theme.colors')
    vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors['paper'], bg = '', bold = false })
  end,
}
