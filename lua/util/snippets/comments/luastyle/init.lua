local utils = require('util.snippets.comments')
local M = {}

local prefix = '---'
M.vim_filetype = utils.vim_filetype(prefix)
M.todo_comment = utils.todo_comment(prefix)
M.line_comment = utils.line_comment(prefix)

return M
