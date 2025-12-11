vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.g.editorconfig = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

vim.schedule(function()
  vim.cmd.colorscheme('catppuccin')
  vim.o.clipboard = 'unnamedplus'

  -- vim.api.nvim_create_autocmd('BufEnter', {
  --   callback = function()
  --     vim.system({ 'task', '--list-all' }, { text = true }, function(result)
  --       if result.code == 0 then
  --         vim.notify('found valid Taskfile.yml', 'debug')
  --         vim.notify('tasks: ' .. result.stdout)
  --       else
  --         vim.notify('failed to find valid Taskfile.yml', 'warn')
  --       end
  --     end)
  --   end,
  -- })
  --
  -- vim.keymap.set('n', '<leader>rt', function()
  --   vim.fn.inputsave()
  --   local task = vim.fn.input('Task to execute')
  --   vim.fn.inputrestore()
  --   require('termim').open('task ' .. task, 'float', true)
  -- end, { desc = '' })
end)
