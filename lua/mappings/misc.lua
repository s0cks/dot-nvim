local wez = require('wezterm-cli')
---@type table<LazyKeysSpec>
return {
  {
    '<leader><BS><BS>',
    '<CMD>qall!<CR>',
    'n',
    desc = 'Quit all',
  },
  {
    '<BS>',
    '<CMD>noh<CR>',
    'n',
    desc = 'Clear current search highlight',
  },
  --- System + Wezterm integration
  {
    '<leader>ld',
    wez.lazydocker(),
    'n',
    desc = 'Run lazydocker',
  },
  {
    '<leader>ls',
    wez.lazyssh(),
    'n',
    desc = 'Run lazyssh',
  },
  {
    '<leader>n',
    wez.navi(),
    'n',
    desc = 'Run navi',
  },
  {
    '<leader>btm',
    wez.bottom(),
    'n',
    desc = 'Run bottom',
  },
  {
    '<leader>tldr',
    function()
      local docs = vim.fn.input('tldr: ')
      require('tldr').tldr(docs)
    end,
    'n',
    desc = 'Open tealdeer',
  },
}
