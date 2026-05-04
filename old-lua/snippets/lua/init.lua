local util = require('util.snippets')
local ls = require('luasnip')
local sn = ls.snippet_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local luastyle = require('util.snippets.comments').luastyle

---@alias s0cks.AutoPostfixIfCondition
---| '=='
---| '~='

--- Create an auto_postfix snippet for checking a local type
---@param type string The expected type of the variable
---@param alias? string The alias (shorthand) of the type
local function auto_postfix_if(type, alias)
  return util.auto_postfix('.if' .. (alias or type), function(capture)
    return sn(nil, {
      t('if type(' .. capture .. ") == '" .. type .. "' then"),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end' }),
    })
  end, {
    descr = 'Do something if the type of a variable is a ' .. type,
  })
end

--- Create an auto_postfix snippet for checking a local type
---@param type string The expected type of the variable
---@param alias? string The alias (shorthand) of the type
local function auto_postfix_if_not(type, alias)
  return util.auto_postfix('.ifnot' .. (alias or type), function(capture)
    return sn(nil, {
      t('if type(' .. capture .. ") ~= '" .. type .. "' then"),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end' }),
    })
  end, {
    descr = 'Do something if the type of a variable is not a ' .. type,
  })
end

local function init_local_table()
  return s('local.table', {
    t({ 'local ' }),
    i(1, 'name'),
    t({ ' = {', '\t' }),
    i(0),
    t({ '\t', '}' }),
  }, {
    descr = 'Create a local table',
  })
end

local function init_local_func()
  return s('local.func', {
    t({ 'local ' }),
    i(1, 'name'),
    t({ ' = function()', '\t' }),
    i(0),
    t({ '\t', 'end' }),
  }, {
    descr = 'Create a local function',
  })
end

local snippets = {
  init_local_table(),
  init_local_func(),
  --- X=table --> X = { .. },
  util.auto_postfix('=table', function(capture)
    return sn(nil, {
      t(capture .. ' = {'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', '},' }),
    })
  end, {
    descr = 'Assign to new table',
  }),
  --- X=func --> X = function() end,
  util.auto_postfix('=func', function(capture)
    return sn(nil, {
      t(capture .. ' = function()'),
      t({ '', '\t' }),
      ls.insert_node(1),
      t({ '', 'end,' }),
    })
  end, {
    descr = 'Assign to new function',
  }),
  --- X=str --> X = '',
  util.auto_postfix('=str', function(capture)
    return sn(nil, {
      t(capture .. " = '"),
      ls.insert_node(1),
      t("',"),
      ls.insert_node(0),
    })
  end, {
    descr = 'Assign to new function',
  }),

  --- <X>.iftable --> if type(X) == "table" then ... end
  auto_postfix_if('table'),
  --- <X>.ifstring --> if type(X) == "string" then ... end
  auto_postfix_if('string', 'str'),
  --- <X>.ifnumber --> if type(X) == "number" then ... end
  auto_postfix_if('number', 'num'),
  --- <X>.ifboolean --> if type(X) == "boolean" then ... end
  auto_postfix_if('boolean', 'bool'),
  --- <X>.iffunction --> if type(X) == "function" then ... end
  auto_postfix_if('function', 'func'),

  --- <X>.not-table --> if type(X) == "table" then ... end
  auto_postfix_if_not('table'),
  --- <X>.not-string --> if type(X) == "string" then ... end
  auto_postfix_if_not('string', 'str'),
  --- <X>.not-number --> if type(X) == "number" then ... end
  auto_postfix_if_not('number', 'num'),
  --- <X>.not-boolean --> if type(X) == "boolean" then ... end
  auto_postfix_if_not('boolean', 'bool'),
  --- <X>.not-func --> if type(X) ~= "function" then ... end
  auto_postfix_if_not('function', 'func'),

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
  luastyle.line_comment(),
  luastyle.todo_comment(),
}

local function add_snippets(name)
  for _, snippet in ipairs(require('snippets.lua.' .. name .. '_snippets')) do
    table.insert(snippets, snippet)
  end
end

add_snippets('win')
add_snippets('buf')
add_snippets('table')

return snippets
