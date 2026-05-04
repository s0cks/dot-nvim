local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function iwyu(tag)
  return {
    t({
      '// IWYU pragma: ' .. tag,
    }),
    i(0),
  }
end

return {
  s('iwyu-pragma', {
    t({
      '// IWYU pragma: ',
    }),
    i(1, 'keep'),
  }),
  s('iwyu-keep', iwyu('keep')),
  --- exports
  s('iwyu-exp-begin', iwyu('begin_exports')),
  s('iwyu-exp-end', iwyu('end_exports')),
  s('iwyu-exp-blk', {
    t({
      '// IWYU pragm: begin_exports',
    }),
    i(0),
    t({
      '// IWYU pragma: end_exports',
    }),
  }),
}
