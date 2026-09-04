local utils = require('utils')

local snippets = {}
utils.append(snippets, require('util.snippets.comments.cstyle'))
utils.append(snippets, require('util.snippets.iwyu'))

return snippets
