local M = {}
local snacks = require('snacks')
local Toggle = snacks.toggle

local function get_toggle_id(id)
  return id:gsub('%-', '_')
end

function M.new_global_toggle(id, name, opts)
  id = get_toggle_id(id)
  local negated = opts and opts.negated
  return Toggle.new({
    id = id,
    name = name or id,
    get = opts.get or function()
      return negated and not vim.g[id] or vim.g[id]
    end,
    set = opts.set or function(state)
      vim.g[id] = negated and not state or state
      if opts.on_change then
        opts.on_change(state)
      end
    end,
  })
end

function M.new_buffer_toggle(id, name, opts)
  id = get_toggle_id(id)
  local negated = opts and opts.negated
  return Toggle.new({
    id = id,
    name = name or id,
    get = get or function()
      local buff = vim.b[vim.api.nvim_get_current_buf()]
      if negated then
        return not buff[id]
      end

      return buff[id]
    end,
    set = set or function(state)
      local buff = vim.b[vim.api.nvim_get_current_buf()]
      if negated then
        state = not state
      end
      buff[id] = state
      if opts.on_change then
        opts.on_change(state)
      end
    end,
  })
end

return M
