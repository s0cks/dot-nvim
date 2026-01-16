---Triforce - Neovim gamification
---@url https://github.com/gisketch/triforce.nvim
---@type LazyPluginSpec
return {
  'gisketch/triforce.nvim',
  dependencies = {
    'nvzone/volt',
  },
  opts = {
    notifications = {
      enabled = false,
    },
    keymap = {
      show_profile = '<leader>tri', -- Open profile with <leader>tp
    },
  },
}
