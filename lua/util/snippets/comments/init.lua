local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

local M = {}

function M.vim_filetype(prefix)
  return function()
    local body = 'vim: filetype={} :'
    return s(
      'vim.filetype',
      fmt(prefix .. ' ' .. body, {
        i(1, 'filetype'),
      }),
      {
        desc = 'Create a vim filetype comment',
      }
    )
  end
end

function M.todo_comment(prefix)
  return function()
    local body = 'TODO(@{}): {}'
    return s(
      'cmt.todo',
      fmt(prefix .. ' ' .. body, {
        i(1, 'owner'),
        i(2, 'comment'),
      }),
      {
        desc = 'Create a TODO comment',
      }
    )
  end
end

function M.line_comment(prefix)
  return function()
    local body = '{}'
    return s(
      'cmt.line',
      fmt(prefix .. ' ' .. body, {
        i(1, 'comment'),
      }),
      {
        desc = 'Create a line comment',
      }
    )
  end
end

function M.block_comment(prefix, postfix)
  return function()
    local body = '{}'
    return s(
      'cmt.blk',
      fmt(prefix .. ' ' .. body .. ' ' .. postfix, {
        i(1, 'comment'),
      }),
      {
        desc = 'Create a block comment',
      }
    )
  end
end

return M
