return {
  {
    '2kabhishek/termim.nvim',
    cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    keys = {
      {
        '<leader>repln',
        '<cmd>Sterm node<cr>',
        desc = 'Open a node shell',
      },
      {
        '<leader>replp',
        '<cmd>Sterm python<cr>',
        desc = 'Open a python shell',
      },
      {
        '<leader>repll',
        '<cmd>Sterm lua<cr>',
        desc = 'Open a lua shell',
      },
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
    },
  },
}
