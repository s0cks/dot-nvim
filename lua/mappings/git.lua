--- TODO(@s0cks): clean this file up
local map = vim.keymap.set
local wez = require('wezterm-cli')

local git_prefix = '<leader>g'

map('n', git_prefix .. 'k', wez.koji(), {
  desc = 'Open koji to create a conventional commit',
})
map('n', git_prefix .. 'rph', wez.serie(), {
  desc = 'Open serie to view the commit graph',
})
map('n', git_prefix .. 'lg', wez.lazygit(), {
  desc = 'Run lazygit',
})
map('n', git_prefix .. 'bw', function()
  vim.fn.jobstart('git browse-web', {
    on_stdout = function() end,
    on_exit = function()
      local fidget = require('fidget')
      fidget.notify('Repository opened', vim.log.levels.INFO)
    end,
  })
end, {
  desc = 'Open GitHub repository in browser',
})
map('n', git_prefix .. 'p', function()
  vim.fn.jobstart('git push', {
    on_stdout = function() end,
    on_exit = function()
      local fidget = require('fidget')
      fidget.notify('Pushed changes', vim.log.levels.INFO)
    end,
  })
end, {
  desc = 'Push changes to git',
})

---@class map_git_opts : snacks.terminal.Opts
---@field desc? string
---@field mode? string
---@field hold? boolean
---@field class? string

---@alias map_git_cmd string|function

---@param keys string
---@param cmd map_git_cmd
---@param opts? map_git_opts
local function map_git(keys, cmd, opts)
  opts = opts or {
    desc = 'Run git ' .. cmd,
  }

  if type(cmd) ~= 'function' then
    local class = opts.class
    if type(cmd) == 'string' then
      if not class then
        class = 'git-' .. cmd
      end
      cmd = 'git ' .. cmd
    elseif type(cmd) == 'table' then
      if not class then
        class = 'git' .. (#cmd > 0 and '-' .. tostring(cmd[1]) or '')
      end
      cmd = 'git ' .. table.concat(cmd, ' ')
    end

    map(opts.mode or 'n', git_prefix .. keys, function()
      wez.spawn_shell(cmd, {
        class = class,
        opts.hold or false,
      })
    end, {
      desc = opts.desc,
    })
  else
    map(opts.mode or 'n', git_prefix .. keys, cmd, {
      desc = opts.desc,
    })
  end
end

map_git('l', 'log')
map_git('s', '-c color.ui=always status | less -R', {
  class = 'git-status',
})
