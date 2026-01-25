local map = vim.keymap.set
local wez = require('wezterm-cli')

map('n', '<BS><BS><BS>', ':qall!<CR>', {
  noremap = true,
  silent = true,
  desc = 'Quit',
})
map('n', '<BS>', ':noh<cr>', {
  noremap = true,
  silent = true,
  desc = 'Clear current search',
})
map('n', '<leader>ls', function()
  wez.spawn({
    '/usr/bin/zsh',
    '-c',
    'ls -lash; read -sk',
  })
end)

-- ╭──────╮
-- │ Lazy │
-- ╰──────╯
map('n', '<leader>L', ':Lazy', {
  noremap = true,
  silent = true,
  desc = 'Open Lazy',
})
map('n', '<leader>LU', ':Lazy update<cr>', {
  noremap = true,
  silent = true,
  desc = 'Update Lazy packages',
})
map('n', '<leader>LL', ':Lazy log<cr>', {
  noremap = true,
  silent = true,
  desc = 'Open Lazy log',
})
map('n', '<leader>LC', ':Lazy check<cr>', {
  noremap = true,
  silent = true,
  desc = 'Check Lazy packages',
})
map('n', '<leader>LX', ':Lazy clean<cr>', {
  noremap = true,
  silent = true,
  desc = 'Clean Lazy packages',
})

require('mappings.git')
require('mappings.repl')
