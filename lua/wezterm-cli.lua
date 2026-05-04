local M = {}

---@alias wez.cli.Direction
---| 'bottom'
---| 'top'
---| 'left'
---| 'right'

---@class wez.cli.SplitOpts
---@field cwd? string The current working directory
---@field percent? number The size of the split
---@field dir? wez.cli.Direction The direction of the split

---@param cmd string|string[] The command to run
---@param opts? wez.cli.SplitOpts
function M.split(cmd, opts)
  opts = vim.tbl_deep_extend('force', {
    cwd = vim.fn.getcwd(),
    percent = 30,
    dir = 'bottom',
  }, opts or {})

  local command = {
    'wezterm',
    'cli',
    'split-pane',
    '--' .. opts.dir,
    '--cwd',
    opts.cwd,
    '--percent',
    opts.percent,
  }
  if type(cmd) == 'table' then
    for _, name in ipairs(cmd) do
      table.insert(command, name)
    end
  else
    table.insert(command, cmd)
  end

  local out = vim.fn.system(command)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'failed to run ' .. command .. '\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
    }, true, {})
  end
end

---@alias wez.cli.SpawnCommand
---| string
---| table<string>

---@alias wez.cli.SpawnMode
---| 'window'
---| 'tab'

---@class wez.cli.SpawnOpts
---@field cwd? string The current working directory
---@field mode? wez.cli.SpawnMode The mode to spawn the new process
---@field class? string The class of the window
---@field on_error? function(cmd: wez.cli.SpawnCommand, opts: wez.cli.SpawnOpts, data: string|nil)
---@field on_finished? function(cmd: wez.cli.SpawnCommand)

---@param cmd wez.cli.SpawnCommand
---@param opts? wez.cli.SpawnOpts
function M.spawn(cmd, opts)
  opts = vim.tbl_deep_extend(
    'force',
    ---@type wez.cli.SpawnOpts
    {
      cwd = vim.fn.getcwd(),
    },
    opts or {}
  )
  local command = {
    'wezterm',
    'start',
    '--always-new-process',
    '--cwd',
    opts.cwd,
  }

  local cls = 'wezterm'
  if opts.class then
    cls = opts.class
  elseif not opts.class then
    if type(cmd) == 'string' then
      cls = cmd
    elseif type(cmd) == 'table' then
      cls = cmd[1]
    end
  end

  table.insert(command, '--class')
  table.insert(command, cls)
  table.insert(command, '--')
  if type(cmd) == 'table' then
    for _, name in ipairs(cmd) do
      table.insert(command, name)
    end
  else
    table.insert(command, cmd)
  end

  vim.fn.jobstart(command)
end

---@class wez.cli.SpawnShellOpts : wez.cli.SpawnOpts
---@field hold? boolean Whether or not to require input before closing

function M.spawn_shell(cmd, opts)
  if opts.hold then
    cmd = cmd .. '; read -sk'
  end

  local command = {
    '/usr/bin/zsh',
    '-c',
    cmd,
  }
  return M.spawn(command, opts)
end

---@param opts? wez.cli.SpawnOpts
function M.spawn_repl(repl, opts)
  return function()
    M.spawn({
      repl,
    }, opts or {})
  end
end

---@param cmd string|table<string> The command to spawn
---@param class? string The class of the spawned command
---@return function
local function spawn(cmd, class)
  return function()
    return function()
      M.spawn(cmd, {
        class = class,
      })
    end
  end
end

---@class wez.cli.GitOpts : wez.cli.SpawnOpts
---@field hold? boolean

---@param cmd string|table<string> The command to spawn
---@param opts? wez.cli.SpawnShellOpts
---@return function
local function spawn_shell(cmd, opts)
  return function()
    return function()
      M.spawn_shell(cmd, opts or {})
    end
  end
end

---@alias wez.cli.GitCommand string|function|table<string>

---@param cmd wez.cli.GitCommand
---@param opts? wez.cli.GitOpts
---@return function
function M.spawn_git(cmd, opts)
  opts = vim.tbl_deep_extend('force', {
    class = 'git',
  }, opts or {})
  local class = opts.class
  if type(cmd) == 'string' then
    cmd = 'git ' .. cmd
  elseif type(cmd) == 'table' then
    if not class then
      class = 'git' .. (#cmd > 0 and '-' .. tostring(cmd[1]) or '')
    end
    cmd = 'git ' .. table.concat(cmd, ' ')
  end

  if opts.hold then
    cmd = cmd .. '; read -sk'
  end

  local command = {
    '/usr/bin/zsh',
    '-c',
    cmd,
  }

  return function()
    M.spawn(command, {
      class = class,
    })
  end
end

M.koji = spawn('koji')
M.serie = spawn('serie')
M.lazygit = spawn('lazygit')
M.lazydocker = spawn('lazydocker')
M.lazyssh = spawn('lazyssh')
M.navi = spawn('navi')
M.gitleaks = spawn('gitleaks')
M.tealdeer = spawn_shell('tldr', {
  hold = true,
})
M.bottom = spawn('btm', 'bottom')

return M
