local M = {}

local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local themes = require('telescope.themes')
local conf = require('telescope.config').values

---@class find_and_execute_opts
---@field prompt? string The prompt of the picker
---@field show_detail? boolean Whether or not to show the executor details

---@type find_and_execute_opts
local find_and_execute_defaults = {
  prompt = 'Execute Task',
  show_detail = true,
}

---@param opts? find_and_execute_opts
function M.find_and_execute(opts)
  ---@type find_and_execute_opts
  opts = vim.tbl_extend('keep', opts or {}, find_and_execute_defaults)
  if opts.show_detail then
    require('executor').commands.show_detail()
  end

  local actions = require('task.actions')
  local client = require('task.lsp_client')

  pickers
    .new(themes.get_dropdown({}), {
      prompt_title = opts.prompt,
      finder = finders.new_table({
        results = client.list_all_tasks(),
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(_, map)
        map({ 'i', 'n' }, '<CR>', actions.execute_and_close(), { desc = 'Execute selected task' })
        map({ 'i', 'n' }, '<S-CR>', actions.execute_and_close(), { desc = 'Execute selected task w/ dry-run mode enabled' })
        return true
      end,
    })
    :find()
end

return M
