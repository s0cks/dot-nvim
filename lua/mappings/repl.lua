local map = vim.keymap.set

---@class ReplOpts
---@field mode? string
---@field desc? string

---@type ReplOpts
local default_map_repl_opts = {
  mode = 'n',
  desc = 'Open a REPL in Kitty',
}

local wez = require('wezterm-cli')

---@param keys string
---@param shell string
---@param opts? ReplOpts
local function map_repl(keys, shell, opts)
  opts = vim.tbl_extend('force', default_map_repl_opts, opts)
  map(opts.mode or 'n', '<leader>term' .. keys, function()
    wez.spawn({
      shell,
    })
  end, { desc = opts.desc or 'Open a REPL in Kitty' })
end

map_repl('p', 'python', {
  desc = 'Open a  Python REPL',
})
map_repl('n', 'node', {
  desc = 'Open a  Nodejs REPL',
})
map_repl('r', 'irb', {
  desc = 'Open a  Ruby REPL',
})
