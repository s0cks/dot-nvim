---@param specs? table<LazyKeysSpec>
local function map_all(specs)
  local map = vim.keymap.set
  for _, spec in ipairs(specs or {}) do
    map(spec[3], spec[1], spec[2], {
      desc = spec['desc'],
    })
  end
end

map_all(require('mappings.misc'))
require('mappings.git')
map_all(require('mappings.repl'))
map_all(require('mappings.lazy'))
