local map = vim.keymap.set
local wez = require('wezterm-cli')

map('n', '<leader>Gk', wez.koji(), {
  desc = 'Open koji to create a conventional commit',
})
map('n', '<leader>Gcg', wez.serie(), {
  desc = 'Open serie to view the commit graph',
})
map('n', '<leader>Glg', wez.lazygit(), {
  desc = 'Run lazygit',
})

---@class map_git_opts : snacks.terminal.Opts
---@field desc? string
---@field mode? string
---@field hold? boolean

---@alias map_git_cmd string|function

---@param keys string
---@param cmd map_git_cmd
---@param opts? map_git_opts
local function map_git(keys, cmd, opts)
  opts = opts or {}
  if type(cmd) ~= 'function' then
    if type(cmd) == 'string' then
      cmd = 'git ' .. cmd
    elseif type(cmd) == 'table' then
      cmd = 'git ' .. table.concat(cmd, ' ')
    end

    if opts.hold then
      cmd = cmd .. '; read -sk'
    end

    local command = {
      '/usr/bin/zsh',
      '-c',
      cmd,
    }

    cmd = function()
      print('spawning: ' .. table.concat(command, ' '))
      wez.spawn(command)
    end

    map(opts.mode or 'n', '<leader>G' .. keys, cmd, {
      desc = opts.desc or ('Run: ' .. table.concat(command, ' ')),
    })
    return
  end

  map(opts.mode or 'n', '<leader>G' .. keys, cmd, {
    desc = opts.desc,
  })
end

map_git('l', 'log')
map_git('s', '-c color.ui=always status | less -R')
