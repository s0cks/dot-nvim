return {
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    cmd = 'Nerdy',
  },
  {
    'garymjr/nvim-snippets',
    keys = {
      {
        '<Tab>',
        function()
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
            return
          end
          return '<Tab>'
        end,
        expr = true,
        silent = true,
        mode = 'i',
      },
      {
        '<Tab>',
        function()
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end,
        expr = true,
        silent = true,
        mode = 's',
      },
      {
        '<S-Tab>',
        function()
          if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
            return
          end
          return '<S-Tab>'
        end,
        expr = true,
        silent = true,
        mode = { 'i', 's' },
      },
    },
    opts = {
      friendly_snippets = true,
      search_paths = {
        vim.fn.stdpath('config') .. '/snippets',
        vim.fn.getcwd() .. '/snippets',
      },
    },
  },
  {
    'gbprod/yanky.nvim',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'deathbeam/autocomplete.nvim',
    version = '*',
    config = function(_, opts)
      require('autocomplete.cmd').setup(opts.cmd or {})
    end,
  },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    opts = {},
    config = function() end,
  },
  {
    'mateuszwieloch/automkdir.nvim',
    opts = {},
  },
  {
    'OXY2DEV/helpview.nvim',
    lazy = false,
    opts = {},
  },
}
