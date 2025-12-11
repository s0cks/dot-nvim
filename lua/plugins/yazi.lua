--- Yazi - Terminal file manager & explorer
---@url https://github.com/mikavilpas/yazi.nvim
---@type LazyPluginSpec
return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>.',
      '<cmd>Yazi cwd<cr>',
      'n',
      desc = 'Open Yazi in the current working directory',
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
