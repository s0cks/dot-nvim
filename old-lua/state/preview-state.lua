local fidget = require('fidget')

local PreviewState = {}
PreviewState.__index = PreviewState
PreviewState.__name = 'PreviewState'

---@class state.PreviewStateOpts
---@field init_state? boolean The initial value of the preview state
---@field on_enable? function|string The on_enable command
---@field on_disable? function|string The on_disable command
local default_preview_state_opts = {
  init_state = false,
}

---@param name string The name of the state.PreviewState
---@opts opts? state.PreviewState The options
function PreviewState:new(name, opts)
  opts = vim.tbl_deep_extend('force', default_preview_state_opts, opts or {})
  local state = setmetatable({}, self)
  state.name = name
  state.enabled = opts.init_state

  if opts.on_enable ~= nil then
    if type(opts.on_enable) == 'function' then
      state.on_enable = opts.on_enable
    elseif type(opts.on_enable) == 'string' then
      state.on_enable = function()
        vim.cmd(opts.on_enable)
      end
    end
  end

  if opts.on_disable ~= nil then
    if type(opts.on_disable) == 'function' then
      state.on_disable = opts.on_disable
    elseif type(opts.on_disable) == 'string' then
      state.on_disable = function()
        vim.cmd(opts.on_disable)
      end
    end
  end

  return state
end

function PreviewState:enable()
  if self.enabled then
    return
  end

  self.enabled = true
  if self.on_enable then
    self.on_enable()
  end
  fidget.notify(self.name .. ' enabled', vim.log.levels.INFO)
end

function PreviewState:disable()
  if not self.enabled then
    return
  end

  self.enabled = false
  if self.on_disable then
    self.on_disable()
  end
  fidget.notify(self.name .. ' disabled', vim.log.levels.INFO)
end

function PreviewState:toggle()
  if self.enabled then
    self:disable()
  else
    self:enable()
  end
end

return PreviewState
