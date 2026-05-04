local utils = require('utils')
local cstyle = require('util.snippets.comments').cstyle

local snippets = {
  cstyle.line_comment(),
  cstyle.todo_comment(),
  cstyle.block_comment(),
}
utils.append(snippets, require('util.snippets.iwyu'))
return snippets
