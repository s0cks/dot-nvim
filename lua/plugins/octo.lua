---@type LazyPluginSpec
return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'yamatsum/nvim-nonicons',
  },
  opts = {
    enable_builtin = true,
    picker = 'telescope',
  },
}
