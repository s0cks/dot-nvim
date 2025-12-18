--- Harpoon - Bookmarks
---@url https://github.com/ThePrimeagen/harpoon
---@type LazyPluginSpec
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    mark_branch = true,
    tabline = true,
    tabline_prefix = '   ',
    tabline_suffix = '   ',
  },
  keys = {
    {
      '<leader>ha',
      function()
        local harpoon = require('harpoon')
        harpoon:list():add()
      end,
      'n',
      desc = 'Add a 🔱 Harpoon Mark',
    },
    {
      '<leader>ht',
      function()
        local ha_picker = require('plugins.harpoon.picker')
        ha_picker()
      end,
      'n',
      desc = 'Test harpoon',
    },
    {
      '<leader>fh',
      function()
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      'n',
      desc = 'Find 🔱 Harpoon Marks',
    },
  },
}
