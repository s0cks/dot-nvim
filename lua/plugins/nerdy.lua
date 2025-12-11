--- Nerdy - NerdFont picker using snacks.nvim picker
---@url https://github.com/2kabhishek/nerdy.nvim
---@type LazyPluginSpec
return {
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  event = 'VeryLazy',
  cmd = 'Nerdy',
  opts = {},
}
