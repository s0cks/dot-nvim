---@url https://github.com/nvim-pack/nvim-spectre
---@type LazyPluginSpec
return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'trouble.nvim',
  },
  version = '*',
  opts = {
    open_cmd = 'new',
    default = {
      find = {
        cmd = 'rg',
      },
      replace = {
        cmd = 'sd',
      },
    },
  },
  keys = {
    {
      '<leader>sw',
      function()
        require('spectre').open_visual({
          select_word = true,
        })
      end,
      'n',
      desc = 'Search current word using Spectre',
    },
    {
      '<leader>sp',
      function()
        require('spectre').open_file_search({
          select_word = true,
        })
      end,
      'n',
      desc = 'Search on current file using Spectre',
    },
  },
}
