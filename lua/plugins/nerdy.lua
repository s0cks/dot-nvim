---@type LazyPluginSpec
return {
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'folke/snacks.nvim',
  },
  cmd = 'Nerdy',
  opts = { },
  init = function()
    require('telescope').load_extension('nerdy')
  end,
  keys = {
    {
      '<leader>fnft',
      function()
        require('telescope').extensions.nerdy.nerdy()
      end,
      { 'n' },
      {
        silent = truejjjj,
        desc = 'Search for NerdFont character using Telescope 󰭎 ',
      }
    }
  }
}
