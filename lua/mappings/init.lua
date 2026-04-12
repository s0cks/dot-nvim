local map = vim.keymap.set
local wez = require('wezterm-cli')

map('n', '<leader><BS><BS>', '<CMD>qall!<CR>', {
  noremap = true,
  silent = true,
  desc = 'Quit',
})
map('n', '<BS>', '<CMD>noh<CR>', {
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

map('n', '<leader>tp', ':TypstPreview<cr>', {
  silent = true,
  desc = 'Open typst live preview',
})

map('n', '<D-a>', function()
  vim.notify('Hello World')
end, {
  desc = 'Test super key',
})

-- ╭──────╮
-- │ Lazy │
-- ╰──────╯
map('n', '<leader>L', '<CMD>Lazy', {
  noremap = true,
  silent = true,
  desc = 'Open Lazy',
})
map('n', '<leader>LU', '<CMD>Lazy update<CR>', {
  noremap = true,
  silent = true,
  desc = 'Update Lazy packages',
})
map('n', '<leader>LL', '<CMD>Lazy log<CR>', {
  noremap = true,
  silent = true,
  desc = 'Open Lazy log',
})
map('n', '<leader>LC', '<CMD>Lazy check<CR>', {
  noremap = true,
  silent = true,
  desc = 'Check Lazy packages',
})
map('n', '<leader>LX', '<CMD>Lazy clean<CR>', {
  noremap = true,
  silent = true,
  desc = 'Clean Lazy packages',
})

require('mappings.git')
require('mappings.repl')
