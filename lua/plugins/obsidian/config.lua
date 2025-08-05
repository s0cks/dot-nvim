local vault = require('plugins.obsidian.vault')
return {
  workspaces = vault.get_workspaces(),
  completion = {
    blink = true,
  },
  picker = {
    name = 'fzf-lua',
  },
  ui = {
    ignore_conceal_warn = true,
  },
}
