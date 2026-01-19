local map = vim.keymap.set
local wez = require('wezterm-cli')

map('n', '<Esc><Esc><Esc>', ':qall!<CR>', {
  noremap = true,
  silent = true,
  desc = 'Quit',
})
map('n', '<leader>ls', function()
  wez.spawn({
    '/usr/bin/zsh',
    '-c',
    'ls -lash; read -sk',
  })
end)

require('mappings.git')
require('mappings.repl')
