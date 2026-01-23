local util = require('snippets.util')

local ls = require('luasnip')
local sn = ls.snippet_node
local t = ls.text_node

local function if_type(var_type)
  return util.auto_postfix('.if' .. var_type, function(capture)
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
  util.auto_postfix('eqtbl', function(capture)
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
  util.auto_postfix('eqfunc', function(capture)
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
  util.auto_postfix('.forkv', function(capture)
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
  util.auto_postfix('.foreach', function(capture)
    return sn(nil, {
      t('for idx, name in ipairs(' .. capture .. ') do'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end' }),
    })
  end, {
    descr = 'Do something if variable is a table.',
  }),
  util.auto_postfix('.class', function(capture)
    return sn(nil, {
      t({ '', 'local ' .. capture .. ' = {}' }),
      t({ '', capture .. '.__index = ' .. capture }),
      t({ '', '' }),
      ls.insert_node(1),
      t({ '', '' }),
      t({ '', 'return ' .. capture }),
    })
  end, {
    descr = 'Generate a lua class',
  }),
}
