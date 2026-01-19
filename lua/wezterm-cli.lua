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

---@alias wez.cli.SpawnMode
---| 'window'
---| 'tab'

---@class wez.cli.SpawnOpts
---@field cwd? string The current working directory
---@field mode? wez.cli.SpawnMode The mode to spawn the new process

---@param cmd string|string[] The command
---@param opts? wez.cli.SpawnOpts
function M.spawn(cmd, opts)
  opts = vim.tbl_deep_extend(
    'force',
    ---@as wez.cli.SpawnOpts
    {
      cwd = vim.fn.getcwd(),
      mode = 'window',
    },
    opts or {}
  )
  local command = {
    'wezterm',
    'cli',
    'spawn',
    '--cwd',
    opts.cwd,
  }
  if opts.mode and opts.mode == 'window' then
    table.insert(command, '--new-window')
  end
  table.insert(command, '--')
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

---@class wez.cli.KojiOpts : wez.cli.SpawnOpts
local default_koji_opts = {}

---@param opts? wez.cli.KojiOpts
function M.koji(opts)
  opts = vim.tbl_deep_extend('force', default_koji_opts, opts or {})
  return function()
    M.spawn({ 'koji' }, opts)
  end
end

---@class wez.cli.SerieOpts : wez.cli.SpawnOpts
local default_serie_opts = {}

---@param opts? wez.cli.SerieOpts
function M.serie(opts)
  opts = vim.tbl_deep_extend('force', default_serie_opts, opts or {})
  return function()
    M.spawn({ 'serie' }, opts)
  end
end

---@class wez.cli.LazygitOpts : wez.cli.SpawnOpts
local default_lazygit_opts = {}

---@param opts? wez.cli.LazygitOpts
function M.lazygit(opts)
  opts = vim.tbl_deep_extend('force', default_lazygit_opts, opts or {})
  return function()
    M.spawn({ 'lazygit' }, opts)
  end
end

return M
