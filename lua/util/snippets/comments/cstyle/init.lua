local utils = require('util.snippets.comments')

local prefix = '//'
return {
  utils.vim_filetype(prefix),
  utils.line_comment(prefix),
  utils.todo_comment(prefix),
  utils.block_comment('/*', '*/'),
}
