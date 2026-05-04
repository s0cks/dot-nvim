---@class ReplOpts
---@field mode? string
---@field desc? string

---@type ReplOpts
local default_map_repl_opts = {
  mode = 'n',
  desc = 'Open REPL in Kitty',
}

local wez = require('wezterm-cli')

---@param keys string
---@param shell string
---@param opts? ReplOpts
local function repl(keys, shell, opts)
  opts = vim.tbl_extend('force', default_map_repl_opts, opts)
  return {
    '<leader>term' .. keys,
    wez.spawn_repl(shell),
    opts.mode or 'n',
    desc = opts.desc,
  }
end

return {
  repl('p', 'python', {
    desc = 'Open a  Python REPL',
  }),
  repl('n', 'node', {
    desc = 'Open a  Nodejs REPL',
  }),
  repl('r', 'irb', {
    desc = 'Open a  Ruby REPL',
  }),
}
