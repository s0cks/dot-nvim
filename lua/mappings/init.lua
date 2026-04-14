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
map('n', '<leader>tp', ':TypstPreview<cr>', {
  silent = true,
  desc = 'Open typst live preview',
})
map('n', '<leader>ld', wez.lazydocker(), {
  desc = 'Run lazydocker',
})

require('mappings.git')
require('mappings.repl')
require('mappings.lazy')
