local M = {}
local devicons = require('nvim-web-devicons')
M.get_icon_color = devicons.get_icon_color
M.python = devicons.get_icon('example.py', 'py')
M.nodejs = devicons.get_icon('example.js', 'js')
M.ruby = devicons.get_icon('example.rb', 'rb')
M.sh = devicons.get_icon('example.sh', 'sh')
M.lua = devicons.get_icon('example.lua', 'lua')
return M
