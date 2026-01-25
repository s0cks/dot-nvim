vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
vim.g.editorconfig = true

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
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.mousescroll = 'ver:1,hor:0'
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.foldcolumn = '1'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99

vim.opt.fillchars = { eob = ' ' }
vim.opt.fillchars.foldstart = 'nf-fa-chevron_down'
vim.opt.fillchars.foldstop = 'nf-fa-chevron_up'
vim.opt.clipboard = 'unnamedplus'

vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}
