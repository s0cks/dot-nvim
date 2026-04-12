local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('todo', {
    t({
      '// TODO(@s0cks): ',
    }),
    i(0),
  }),
}
