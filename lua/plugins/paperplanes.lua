---@type LazyPluginSpec
return {
  'rktjmp/paperplanes.nvim',
  version = '*',
  event = 'VeryLazy',
  opts = {
    register = '+',
    provider = 'gist',
    provider_options = {
      command = 'gh',
    },
    notifier = vim.notify or print,
  },
}
