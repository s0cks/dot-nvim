require('settings')

-- Bootstrap lazy.vim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    {
      'kepano/flexoki-neovim',
      name = 'flexoki',
      priority = 1000,
      lazy = false,
      opts = {},
      init = function()
        vim.cmd([[colorscheme flexoki-dark]])
      end,
    },
    { import = 'ui' },
    require('blink'),
    require('ts'),
    require('lsp'),
    { import = 'plugins' },
    { import = 'linting' },
    require('formatting'),
    require('debugger'),
  },
  install = {
    colorscheme = { 'flexoki-dark' },
    missing = true,
  },
  checker = { enabled = false, notify = false },
})
