local M = {}

---@class task.TaskSpec
---@field name string The task name
---@field task string The task id
---@field desc? string The task description

function M.list_all_tasks()
  local tasks = vim.system({ 'task', '--list-all', '--json' }, { text = true }):wait()

  local results = {}
  if tasks.code ~= 0 then
    vim.print('error getting list of tasks: ' .. tasks.stderr)
    return results
  end

  return vim.json.decode(tasks.stdout).tasks
end

---@class task.ExecuteOpts
---@field dry_run? boolean Whether or not to run the task w/ dry-run mode

---@type task.ExecuteOpts
local default_execute_opts = {
  dry_run = false,
  exec = 'task',
}

---@param opts? task.ExecuteOpts
function M.execute(name, opts)
  opts = vim.tbl_extend('force', default_execute_opts, opts or {})
  local command = {
    opts.exec,
  }
  if opts.dry_run then
    table.insert(command, '--dry-run')
  end
  table.insert(command, name)
  local cmd = table.concat(command, ' ')
  require('executor').commands.run_one_off(cmd)
end

return M
