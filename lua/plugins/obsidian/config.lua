local all_workspaces = {
  'Personal',
  'Work',
  'Prette',
}

local workspaces = {}

for _, name in ipairs(all_workspaces) do
  table.insert(workspaces, {
    name = name,
    path = '~/Obsidian/' .. name,
  })
end

return {
  workspaces = workspaces,
  completion = {
    blink = true,
  },
  picker = {
    name = 'fzf-lua',
  },
  ui = {
    ignore_conceal_warn = true,
  },
}
