local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node

local function postfix(trigger, cb, config, auto)
  local default_config = {
    trig = trigger,
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

local function auto_postfix(trigger, cb, config)
  return postfix(trigger, cb, config, true)
end

local function if_type(var_type)
  return auto_postfix('.if' .. var_type, function(capture)
    return sn(nil, {
      t('if type(' .. capture .. ') == "' .. var_type .. '" then'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end' }),
    })
  end, {
    descr = 'Do something if variable is a ' .. var_type .. '.',
  })
end

return {
  --- Xeqtbl --> X = { .. }
  auto_postfix('eqtbl', function(capture)
    return sn(nil, {
      t(capture .. ' = {'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', '},' }),
    })
  end, {
    descr = 'Assign to new table',
  }),
  --- Xeqfunc --> X = function() end,
  auto_postfix('eqfunc', function(capture)
    return sn(nil, {
      t(capture .. ' = function()'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end,' }),
    })
  end, {
    descr = 'Assign to new function',
  }),
  --- <X>.iftable --> if type(X) == "table" then ... end
  if_type('table'),
  --- <X>.ifstring --> if type(X) == "string" then ... end
  if_type('string'),
  --- <X>.ifnumber --> if type(X) == "number" then ... end
  if_type('number'),
  --- <X>.ifboolean --> if type(X) == "boolean" then ... end
  if_type('boolean'),
  --- <X>.iffunction --> if type(X) == "function" then ... end
  if_type('function'),
  --- X.forkv --> for k,v in pairs(X) do ... end
  auto_postfix('.forkv', function(capture)
    return sn(nil, {
      t('for k,v in pairs(' .. capture .. ') do'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end' }),
    })
  end, {
    descr = 'Iterate the key-value pairs of the table',
  }),
  --- X.foreach --> for _, n in ipairs(X) do ... end
  auto_postfix('.foreach', function(capture)
    return sn(nil, {
      t('for idx, name in ipairs(' .. capture .. ') do'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end' }),
    })
  end, {
    descr = 'Do something if variable is a table.',
  }),
}
