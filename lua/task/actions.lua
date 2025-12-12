local M = {}

local actions = require('telescope.actions')

function M.execute()
  return function()
    local selected = require('telescope.actions.state').get_selected_entry()
    if selected then
      require('executor').commands.run_one_off('task ' .. selected.value)
    end
  end
end

function M.execute_and_close()
  return function(bufnr)
    local selected = require('telescope.actions.state').get_selected_entry()
    if selected then
      require('executor').commands.run_one_off('task ' .. selected.value)
    end
    actions.close(bufnr)
  end
end

return M
