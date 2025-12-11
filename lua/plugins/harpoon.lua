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
        require('harpoon'):list():add()
      end,
      'n',
      desc = 'Add a 🔱 Harpoon Mark',
    },
    {
      '<leader>hf',
      ':Telescope harpoon marks<cr>',
      'n',
      desc = 'Browse 🔱 Harpoon Marks w/ 🔭 Telescope',
    },
  },
}
