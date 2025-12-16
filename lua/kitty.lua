local M = {}

---TODO(@s0cks): finish adding remaining launch types from kitty
---@alias kitty.LaunchType
---| 'tab'
---| 'window'
---| 'overlay'
---| 'overlay-main'

---@class kitty.LaunchOpts
---@field type? kitty.LaunchType The type to launch
---@field hold? boolean Whether o not to hold the terminal open after shell exits
---@field on_error? fun(code, stderr)
---@field on_success? fun(code, stdout)

---@type kitty.LaunchOpts
local default_launch_opts = {
  type = 'window',
  hold = false,
  on_error = nil,
  on_success = nil,
}

---@alias kitty.LaunchCommand string|table

---@param cmd kitty.LaunchCommand
---@param opts? kitty.LaunchOpts
function M.launch(cmd, opts)
  opts = vim.tbl_extend('force', default_launch_opts, opts or {})
  local command = {}
  table.insert(command, 'kitty')
  table.insert(command, '@')
  table.insert(command, 'launch')
  table.insert(command, '--type=' .. opts.type)
  table.insert(command, '--cwd=' .. (opts.cwd or vim.fn.getcwd()))
  if opts.hold then
    table.insert(command, '--hold')
  end

  if type(cmd) == 'string' then
    table.insert(command, cmd)
  elseif type(cmd) == 'table' then
    for _, arg in ipairs(cmd) do
      table.insert(command, arg)
    end
  else
    table.insert(command, tostring(cmd))
  end

  vim.print(table.concat(command, ' '))
  vim.system(command, { text = true }, function(status)
    local success = status.code == 0
    if success and opts.on_success then
      opts.on_success(status.code, status.stdout)
    elseif not success and opts.on_error then
      opts.on_error(status.code, status.stderr)
    end
  end)
end

return M
