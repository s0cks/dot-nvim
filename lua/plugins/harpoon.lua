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
  keys = function()
    local harpoon = require('harpoon')
    return {
      {
        '<leader>ha',
        function()
          harpoon:list():add()
        end,
        'n',
        desc = 'Add a 🔱 Harpoon Mark',
      },
      {
        '<leader>ht',
        function()
          for idx, value in ipairs(harpoon:list().items) do
            print(idx .. ': ' .. vim.inspect(value))
          end
        end,
        'n',
        desc = 'Test harpoon',
      },
      {
        '<leader>fh',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        'n',
        desc = 'Find 🔱 Harpoon Marks',
      },
    }
  end,
}
