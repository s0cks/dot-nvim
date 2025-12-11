return {
  ---@url https://github.com/nvim-pack/nvim-spectre
  ---@type LazyPluginSpec
  {
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
  },
}
