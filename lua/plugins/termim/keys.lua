local function bind_repl_open(keys, shell, dir)
  if not dir or dir == 'floating' then
    return {
      '<leader>repl' .. keys,
      '<cmd>Fterm ' .. shell .. '<cr>',
      'n',
      desc = 'Open a floating ' .. shell .. ' repl',
    }
  elseif dir and dir == 'vertical' then
    return {
      '<leader>replv' .. keys,
      '<cmd>Vterm ' .. shell .. '<cr>',
      'n',
      desc = 'Open a vertical ' .. shell .. ' repl',
    }
  elseif dir and dir == 'horizontal' then
    return {
      '<leader>replh' .. keys,
      '<cmd>Sterm ' .. shell .. '<cr>',
      'n',
      desc = 'Open a horizontal ' .. shell .. ' repl',
    }
  end
end

return {
  --- Generic Terminals
  {
    '<leader>th',
    '<cmd>Sterm<cr>',
    desc = 'Open a horizontal terminal',
  },
  {
    '<leader>tf',
    '<cmd>Fterm<cr>',
    desc = 'Open a floating terminal',
  },
  {
    '<leader>tv',
    '<cmd>Vterm<cr>',
    desc = 'Open a vertical terminal',
  },
  --- REPLs
  ---  Nodejs
  bind_repl_open('n', 'node'),
  bind_repl_open('n', 'node', 'vertical'),
  bind_repl_open('n', 'node', 'horizontal'),
  ---  Python
  bind_repl_open('p', 'python'),
  bind_repl_open('p', 'python', 'vertical'),
  bind_repl_open('p', 'python', 'horizontal'),
  ---  Lua
  bind_repl_open('l', 'lua'),
  bind_repl_open('l', 'lua', 'vertical'),
  bind_repl_open('l', 'lua', 'horizontal'),
}
