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
map('n', '<leader>n', wez.navi(), {
  desc = 'Open navi',
})

map('n', '<leader>tldr', function()
  local docs = vim.fn.input('tldr: ')
  require('tldr').tldr(docs)
end, {
  desc = 'Open tealdeer',
})

require('mappings.git')
require('mappings.repl')
require('mappings.lazy')
