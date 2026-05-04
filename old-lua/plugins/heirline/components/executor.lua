local conditions = require('heirline.conditions')
local colors = require('theme.colors')

local status_indicator_icons = {
  IN_PROGRESS = '',
  FAILED = '',
  PASSED = '',
}
local status_indicator_colors = {
  ['IN_PROGRESS'] = colors['ui'],
  FAILED = colors['re'],
  ['GREEN'] = colors['gr'],
}

local ExecutorStatusIndicator = {
  condition = function(self)
    return self.status ~= 'NEVER_RUN'
  end,
  provider = function(self)
    return status_indicator_icons[self.status] or ''
  end,
  hl = function(self)
    if self.status == 'IN_PROGRESS' then
      return { fg = colors['tx-2'] }
    elseif self.status == 'PASSED' then
      return { fg = colors['gr'] }
    elseif self.status == 'FAILED' then
      return { fg = colors['re'] }
    end
    return { fg = colors['tx'] }
  end,
}

local ExecutorLastCommand = {
  condition = function(self)
    return self.last ~= nil
  end,
  provider = function(self)
    local command = self.last.cmd
    if not conditions.width_percent_below(#command, 0.90) then
      command = command:gsub(1, 10)
    end
    return command
  end,
  hl = function(self)
    if self.status == 'IN_PROGRESS' then
      return { fg = colors['tx-2'] }
    end
    return { fg = colors['tx'] }
  end,
  {
    provider = '*',
    condition = function(self)
      return self.last.one_off
    end,
  },
}

local basic_components = require('plugins.heirline.components.basic')
return {
  init = function(self)
    local executor = require('executor')
    self.status = executor.current_status()
    if self.status ~= 'NEVER_RUN' then
      self.last = executor.last_command()
    end
  end,
  update = {
    'User',
    pattern = 'ExecutorRun*',
  },
  ExecutorLastCommand,
  basic_components.Space,
  ExecutorStatusIndicator,
}
