local M = {}

local providers_dir = vim.fn.stdpath('config') .. '/lua/plugins/blink/providers'
local ignored_files = {
  'init.lua',
}

local function is_ignored(file)
  for _, value in ipairs(ignored_files) do
    if value == file then
      return true
    end
  end
  return false
end

local function discover_providers()
  local files = vim.fn.readdir(providers_dir, [[v:val =~ '\.lua$']])
  local results = {}
  for _, provider_file in ipairs(files) do
    if not is_ignored(provider_file) then
      local provider_name = provider_file:sub(0, #provider_file - #'.lua')
      table.insert(results, provider_name)
    end
  end
  return results
end

for _, provider in ipairs(discover_providers()) do
  M[provider] = require('plugins.blink.providers.' .. provider)
end

return M
