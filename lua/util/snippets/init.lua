local M = {}
local ls = require('luasnip')
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node
local p = require('luasnip.extras.postfix')

function M.postfix(trigger, cb, config, auto)
  local default_config = {
    trig = trigger,
    snippetType = auto and 'autosnippet' or 'snippet',
  }
  return p.postfix(
    vim.tbl_deep_extend('force', default_config, config),
    d(1, function(_, parent)
      local capture = parent.snippet.env.POSTFIX_MATCH
      if #capture > 0 then
        return cb(capture)
      end
    end)
  )
end

function M.auto_postfix(trigger, cb, config)
  return M.postfix(trigger, cb, config, true)
end

return M
