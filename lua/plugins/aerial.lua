return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '[', '<cmd>AerialPrev<cr>', { buffer = bufnr })
      vim.keymap.set('n', ']', '<cmd>AerialNext<cr>', { buffer = bufnr })
    end,
  },
  keys = {
    {
      '<leader>aer',
      '<cmd>AerialToggle!<cr>',
      'n',
      desc = 'Toggle arial',
    },
  },
}
