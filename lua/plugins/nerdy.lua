---@type LazyPluginSpec
return {
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'folke/snacks.nvim',
  },
  cmd = 'Nerdy',
  opts = {},
  init = function()
    require('telescope').load_extension('nerdy')
  end,
  keys = {
    {
      '<leader>fnft',
      function()
        require('telescope').extensions.nerdy.nerdy(require('theme.utils').get_telescope_theme())
      end,
      { 'n' },
      {
        silent = true,
        desc = 'Search for NerdFont character using Telescope 󰭎 ',
      },
    },
  },
}
