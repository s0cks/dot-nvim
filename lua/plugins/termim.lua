---@alias TerminalDirection
---| 'floating'   # A floating terminal
---| 'vertical'   # A vertical split
---| 'horizontal' # A horizontal split

---@param dir? TerminalDirection The direction to open the terminal
local function cmd_term(dir)
  if not dir or dir == 'floating' then
    return 'Fterm'
  elseif dir and dir == 'vertical' then
    return 'Vterm'
  elseif dir and dir == 'horizontal' then
    return 'Sterm'
  end
end

---@param keys string The keys to bind for opening the terminal
---@param dir? TerminalDirection The direction to open the terminal
local function bind_term_open(keys, dir)
  return {
    '<leader>term' .. keys,
    '<cmd>' .. cmd_term(dir or 'floating') .. '<cr>',
    'n',
    desc = 'Open a ' .. (dir or 'floating') .. ' terminal',
  }
end

---@param keys string The keys to bind for opening the terminal
---@param shell string The shell to use when opening the terminal
---@param dir? TerminalDirection The direction to open the terminal
local function bind_repl_open(keys, shell, dir)
  return {
    '<leader>repl' .. keys,
    '<cmd>' .. cmd_term(dir or 'floating') .. ' ' .. shell .. '<cr>',
    'n',
    desc = 'Open a ' .. (dir or 'floating') .. ' ' .. shell .. ' repl',
  }
end

return {
  '2kabhishek/termim.nvim',
  lazy = true,
  cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
  opts = {},
  keys = {
    --- Generic Terminals
    {
      '<leader>term',
      group = 'Terminals',
    },
    bind_term_open('h', 'horizontal'),
    bind_term_open('v', 'vertical'),
    bind_term_open('f', 'floating'),
    --- REPLs
    {
      '<leader>repl',
      group = 'REPLs',
    },
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
  },
}
