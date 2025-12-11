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
      '<leader>-',
      ':Yazi<cr>',
      { 'n', 'v' },
      desc = 'Open yazi at the current file',
    },
    {
      '<leader>.',
      ':Yazi cwd<cr>',
      { 'n', 'v' },
      desc = 'Open Yazi in project root',
    },
  },
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
