local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local utils = require('utils')

local function align_snippet(name, align)
  local body = [[
    #align({})[
      {}
    ]
  ]]
  return s(
    'align.' .. name,
    fmt(body, {
      align or name,
      i(0),
    })
  )
end

local function heading_snippet(level)
  local body = [[
    #heading(level: {})[{}]
  ]]
  return s(
    'h' .. level,
    fmt(body, {
      tostring(level),
      i(0),
    })
  )
end

local function bold_snippet()
  local body = [[
    #text(weight: "bold")[{}]
  ]]
  return s(
    'text.bold',
    fmt(body, {
      i(0),
    }),
    {
      desc = 'Create bold text.',
    }
  )
end

local function italic_snippet()
  local body = [[
    #text(style: "italic")[{}]
  ]]
  return s(
    'text.italic',
    fmt(body, {
      i(0),
    }),
    {
      desc = 'Create italic text.',
    }
  )
end

local snippets = {
  align_snippet('center'),
  align_snippet('bottom'),
  align_snippet('left'),
  align_snippet('right'),
  align_snippet('bl', 'bottom + left'),
  align_snippet('br', 'bottom + right'),
  bold_snippet(),
  italic_snippet(),
}
utils.append(snippets, require('util.snippets.comments.cstyle'))

for l = 0, 6 do
  table.insert(snippets, heading_snippet(l))
end

return snippets
