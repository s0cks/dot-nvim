---@class harpoon.snacks.FinderOpts
local default_opts = {}

---@param opts? harpoon.snacks.FinderOpts
return function(opts)
  opts = vim.tbl_deep_extend('force', default_opts, opts or {})
  local harpoon = require('harpoon')
  local items = {}
  print('items:')
  for idx, item in ipairs(harpoon:list().items) do
    print('- ' .. idx .. ': ' .. vim.inspect(item))
    table.insert(items, {
      text = item.value,
      file = item.value,
    })
  end
  return items
end
