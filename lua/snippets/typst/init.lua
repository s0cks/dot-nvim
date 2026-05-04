local util = require('util.snippets')
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local cstyle = require('util.snippets.comments').cstyle

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

return {
  align_snippet('center'),
  align_snippet('bottom'),
  align_snippet('left'),
  align_snippet('right'),
  align_snippet('bl', 'bottom + left'),
  align_snippet('br', 'bottom + right'),
  heading_snippet(0),
  heading_snippet(1),
  heading_snippet(2),
  heading_snippet(3),
  heading_snippet(4),
  heading_snippet(5),
  heading_snippet(6),
  bold_snippet(),
  italic_snippet(),
  cstyle.line_comment(),
  cstyle.todo_comment(),
  cstyle.block_comment(),
}
