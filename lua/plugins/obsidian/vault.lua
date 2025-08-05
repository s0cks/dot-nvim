local vault = vim.fn.expand('~') .. '/Obsidian'

local M = {}
M.path = vim.fn.expand('~') .. '/Obsidian'

function M.get_workspaces()
  local workspaces = {}

  local stream = vim.fn.readdir(vault)
  if stream then
    for _, entry in ipairs(stream) do
      table.insert(workspaces, {
        name = entry,
        path = vault .. '/' .. entry,
      })
    end
  end
  return workspaces
end

return M
