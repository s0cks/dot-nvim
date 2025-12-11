---@type LazyPluginSpec
return {
  'rebelot/heirline.nvim',
  version = '*',
  dependencies = {
    'kepano/flexoki-neovim',
    'lewis6991/gitsigns.nvim',
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
}
