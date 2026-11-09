return {
  cmd = {
    'bash-language-server',
    'start',
  },
  filetypes = { 'bash', 'sh', 'zsh' },
  settings = {
    bashIde = {
      globPattern = '*@(.zsh|.sh|.inc|.bash|.command)',
    },
    filetypes = {
      'sh',
      'zsh',
    },
  },
}
