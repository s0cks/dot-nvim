return {
  register = '+',
  provider = 'gist',
  provider_options = {
    command = 'gh',
  },
  notifier = vim.notify or print,
}
