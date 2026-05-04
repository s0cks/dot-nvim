---Generate key mapping for Neogen
---@param key string The key to bind
---@param func string|function|table The function to bind
---@param opts? table The binding options
---@param mode? table|'n'|'v' The mode for the function
---@return table The new mapping
local function map(key, func, opts, mode)
  local neogen = require('neogen')
  opts = opts or {}

  if type(func) ~= 'function' then
    if type(func) == 'table' then
      func = function()
        neogen.generate(func)
      end
    elseif type(func) == 'string' then
      if not opts.desc then
        opts.desc = 'Generate ' .. func .. ' docs using Neogen'
      end

      func = function()
        neogen.generate({
          type = func,
        })
      end
    end
  end

  return {
    '<leader>ng' .. key,
    func,
    mode or 'n',
    opts,
  }
end

---@author tazz
---@license MIT
return {
  'danymat/neogen',
  version = '*',
  cmd = 'Neogen',
  opts = {},
  keys = function()
    return {
      map('f', 'func', {
        desc = 'Generate function docs using Neogen',
      }),
      map('F', 'file'),
      map('c', 'class'),
      map('t', 'type'),
    }
  end,
}
