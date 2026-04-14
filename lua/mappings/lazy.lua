local map = vim.keymap.set

local function bind_lazy(keys, cmd, opts)
  local prefix = '<leader>l'
  opts = vim.tbl_deep_extend('force', {
    noremap = true,
    silent = true,
  }, opts or {})

  opts.desc = '󰒲 Lazy ' .. opts.desc

  if cmd then
    cmd = 'Lazy ' .. cmd
  end

  map(opts.mode or 'n', prefix .. (keys or ''), '<CMD>' .. (cmd or 'Lazy') .. '<CR>', opts)
end

bind_lazy('o', nil, {
  desc = 'Open',
})
bind_lazy('l', ' log', {
  desc = 'Open log',
})
bind_lazy('c', ' check', {
  desc = 'Check packages',
})
bind_lazy('x', ' clean', {
  desc = 'Clean packages',
})
bind_lazy('u', ' update', {
  desc = 'Update packages',
})
