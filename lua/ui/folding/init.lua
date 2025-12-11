return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>f',
      function()
        require('origami').h()
      end,
      { desc = 'Fold' },
    },
    {
      '<leader>F',
      function()
        require('origami').l()
      end,
      { desc = 'Fold' },
    },
  },
  opts = {
    foldKeymaps = {
      setup = false,
    },
  }, -- needed even when using default config
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 4
    vim.opt.foldcolumn = '1'
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt.fillchars.eob = ' '
    vim.opt.fillchars.foldstart = 'nf-fa-chevron_down'
    vim.opt.fillchars.foldstop = 'nf-fa-chevron_up'
  end,
}
