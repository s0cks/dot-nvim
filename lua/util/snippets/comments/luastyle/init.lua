local utils = require('util.snippets.comments')
local prefix = '---'
return {
  utils.vim_filetype(prefix),
  utils.todo_comment(prefix),
  utils.line_comment(prefix),
}
