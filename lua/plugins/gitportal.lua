---TODO: This should probably be converted over to lazy load on command rather than VeryLazy event
---@type LazyPluginSpec
return {
  'trevorhauter/gitportal.nvim',
  version = '*',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>go',
      function()
        require('gitportal').open_file_in_browser()
      end,
      { 'n', 'v' },
      desc = 'Open  GitHub link in browser',
    },
    {
      '<leader>gc',
      function()
        require('gitportal').copy_link_to_clipboard()
      end,
      { 'n', 'v' },
      desc = 'Copy  GitHub link in to system clipboard',
    },
  },
}
