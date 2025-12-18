local M = {}

---@class harpoon.snacks.actions.RemoveOpts
local default_remove_opts = {}

---@param opts? harpoon.snacks.actions.RemoveOpts
function M.remove(opts)
  opts = vim.tbl_deep_extend('force', default_remove_opts, opts or {})
  return function(picker)
    local current = picker:current()
    if current then
      print('current: ' .. vim.inspect(current))
    end
  end
end

---@class harpoon.snacks.actions.GotoOpts
local default_goto_harpoon_opts = {}

---@param opts? harpoon.snacks.actions.GotoOpts
function M.goto(opts)
  opts = vim.tbl_deep_extend('force', default_goto_harpoon_opts, opts or {})
  return function(picker, item)
    if item then
      vim.schedule(function()
        vim.cmd.edit(vim.fn.fnameescape(item.file))
      end)
      picker:close()
    end
  end
end

return M
