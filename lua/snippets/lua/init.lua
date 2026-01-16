local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node

local function postfix(trigger, cb, config, auto)
  local default_config = {
    snippetType = auto and 'autosnippet' or 'snippet',
  }
  return require('luasnip.extras.postfix').postfix(
    vim.tbl_deep_extend('force', default_config, config),
    d(1, function(_, parent)
      local capture = parent.snippet.env.POSTFIX_MATCH
      if #capture > 0 then
        return cb(capture)
      end
    end)
  )
end

return {
  postfix('eqfunc', function(capture)
    return sn(nil, {
      t(capture .. ' = function()'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end,' }),
    })
  end, {
    descr = 'Assign to new function',
  }, true),
  postfix('eqtbl', function(capture)
    return sn(nil, {
      t(capture .. ' = {'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', '},' }),
    })
  end, {
    descr = 'Assign to new table',
  }, true),
}
