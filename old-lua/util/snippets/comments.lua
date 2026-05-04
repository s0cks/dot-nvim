local util = require('util.snippets')
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

local M = {}
local cstyle = {}
M.cstyle = cstyle

function cstyle.line_comment()
  local body = [[
    // {}
  ]]
  return s(
    'cmt.line',
    fmt(body, {
      i(1, 'comment'),
    }),
    {
      desc = 'Create a line comment',
    }
  )
end

function cstyle.todo_comment()
  local body = [[
    //TODO(@{}): {}
  ]]
  return s(
    'cmt.line',
    fmt(body, {
      i(1, 'owner'),
      i(2, 'comment'),
    }),
    {
      desc = 'Create a TODO comment',
    }
  )
end

function cstyle.block_comment()
  local body = [[
    /* {} */
  ]]
  return s(
    'cmt.blk',
    fmt(body, {
      i(1, 'comment'),
    }),
    {
      desc = 'Create a block comment',
    }
  )
end

local luastyle = {}
M.luastyle = luastyle

function luastyle.line_comment()
  local body = [[
    --- {}
  ]]
  return s(
    'cmt.line',
    fmt(body, {
      i(1, 'comment'),
    }),
    {
      desc = 'Create a line comment',
    }
  )
end

function luastyle.todo_comment()
  local body = [[
    --- TODO(@{}): {}
  ]]
  return s(
    'cmt.todo',
    fmt(body, {
      i(1, 'owner'),
      i(2, 'comment'),
    }),
    {
      desc = 'Create a TODO comment',
    }
  )
end

return M
