local function lazy(keys, cmd, opts)
  local prefix = '<leader>l'
  opts = vim.tbl_deep_extend('force', {
    noremap = true,
    silent = true,
  }, opts or {})

  opts.desc = '󰒲 Lazy ' .. opts.desc

  if cmd then
    cmd = 'Lazy ' .. cmd
  end

  return {
    prefix .. (keys or ''),
    '<CMD>' .. (cmd or 'Lazy') .. '<CR>',
    opts.mode or 'n',
    desc = opts.desc,
  }
end

return {
  lazy('o', nil, {
    desc = 'Open',
  }),
  lazy('l', 'log', {
    desc = 'Open log',
  }),
  lazy('c', 'check', {
    desc = 'Check packages',
  }),
  lazy('x', 'clean', {
    desc = 'Clean packages',
  }),
  lazy('u', 'update', {
    desc = 'Update packages',
  }),
}
