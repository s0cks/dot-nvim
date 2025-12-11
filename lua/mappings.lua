local map = vim.keymap.set
map('n', '<Esc><Esc><Esc>', ':qall!<CR>', {
  noremap = true,
  silent = true,
  desc = 'Quit',
})

local kitty = require('kitty')

--- git
map('n', '<leader>Gl', function()
  kitty.launch({ 'git', 'log' })
end, {
  desc = 'Open git log in kitty window',
})

--- REPLs

---@class map_repl_opts : kitty.LaunchOpts
---@field mode? string
---@field desc? string

---@type map_repl_opts
local default_map_repl_opts = {
  mode = 'n',
  desc = 'Open a REPL in Kitty',
}

---@param keys string
---@param shell string
---@param opts? kitty.LaunchOpts
local function map_repl(keys, shell, opts)
  opts = vim.tbl_extend('force', default_map_repl_opts, opts)
  map(opts.mode or 'n', '<leader>term' .. keys, function()
    kitty.launch(shell, opts or {})
  end, { desc = opts.desc or 'Open a REPL in Kitty' })
end

map_repl('p', 'python', {
  desc = 'Open a Python REPL in Kitty',
})
map_repl('n', 'node', {
  desc = 'Open a Nodejs REPL in Kitty',
})
--- TODO(@s0cks): seems to be an issue w/ opening the proper irb if installed w/ mise
map_repl('r', 'irb', {
  desc = 'Open a Ruby REPL in Kitty',
})
