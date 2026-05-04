local M = {}

local client = require('task.client')
local actions = require('telescope.actions')

---@param opts? task.ExecuteOpts
function M.execute(opts)
  return function(bufnr)
    local selected = require('telescope.actions.state').get_selected_entry()
    if selected then
      client.execute(selected.value, opts)
    end
  end
end

---@param opts? task.ExecuteOpts
function M.execute_and_close(opts)
  return function(bufnr)
    local selected = require('telescope.actions.state').get_selected_entry()
    if selected then
      ---@type task.TaskSpec
      local task = selected.value
      client.execute(task.task, opts)
    end
    actions.close(bufnr)
  end
end

return M
