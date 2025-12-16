local map = vim.keymap.set

map('n', '<leader>Gk', function()
  require('koji').koji()
end, {
  desc = 'Open koji to create a conventional commit',
})

---@class map_git_opts : snacks.terminal.Opts
---@field desc? string
---@field mode? string

---@alias map_git_cmd string|function

---@param keys string
---@param cmd map_git_cmd
---@param opts? map_git_opts
local function map_git(keys, cmd, opts)
  opts = opts or {}
  if type(cmd) ~= 'function' then
    local command = { 'git' }
    if type(cmd) == 'string' then
      table.insert(command, cmd)
    elseif type(cmd) == 'table' then
      for _, arg in ipairs(cmd) do
        table.insert(command, arg)
      end
    end
    cmd = function()
      Snacks.terminal.open(command, { auto_close = false })
    end
  end
  map(opts.mode or 'n', '<leader>G' .. keys, cmd, {
    desc = opts.desc,
  })
end

map_git('l', 'log', {
  desc = 'Open git log',
})
map_git('cz', 'cz', {
  desc = 'Open git cz',
})
map_git('s', 'status', {
  desc = 'Open git status',
})
