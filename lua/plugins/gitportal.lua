---@type LazyPluginSpec
return {
  'trevorhauter/gitportal.nvim',
  version = '*',
  opts = {},
  lazy = true,
  event = 'VeryLazy',
  keys = function()
    local gp = require('gitportal')
    return {
      {
        '<leader>go',
        gp.open_file_in_browser,
        { 'n', 'v' },
        desc = 'Open  GitHub link in browser',
      },
      {
        '<leader>gc',
        gp.copy_link_to_clipboard,
        { 'n', 'v' },
        desc = 'Copy  GitHub link in to system clipboard',
      },
    }
  end,
}
