local M = {}

---@param client vim.lsp.Client The client to use
---@param fsPath? string The fsPath to use
local function _get_tasks_request(client, fsPath)
  local method = 'extension/getTasks'
  local params = {
    fsPath = fsPath or vim.fn.expand('%p'),
  }
  return client:request_sync(method, params)
end

---@param bufnr number The buffer to use
---@return vim.lsp.Client|nil
local function _find_taskfile_lsp_client(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr or 0 })

  if #clients == 0 then
    print('no LSP client attached to the current buffer.')
    return nil
  end

  for _, client in ipairs(clients) do
    if client.name == 'taskfile' then
      return client
    end
  end

  return nil
end

---Query the list of Tasks in the current Taskfile
---@param bufnr number The buffer to send the request for
function M.list_all_tasks(bufnr)
  local client = _find_taskfile_lsp_client(bufnr)

  if not client then
    print('failed to find taskfile LSP client')
    return
  end

  local data, error = _get_tasks_request(client)
  if error then
    print('LSP client error: ' .. vim.inspect(error))
    return
  elseif not data then
    print('LSP no data returned')
    return
  elseif data.err then
    print('LSP responded w/ error: ' .. vim.inspect(data.err))
    return
  end

  local results = {}
  for _, task in ipairs(data.result) do
    table.insert(results, task.task.value)
  end
  return results
end

return M
