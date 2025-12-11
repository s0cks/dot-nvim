return {
  {
    ---@url https://github.com/trevorhauter/gitportal.nvim
    ---@type LazyPluginSpec
    {
      'trevorhauter/gitportal.nvim',
      version = '*',
      lazy = true,
      opts = {},
      keys = {
        {
          '<leader>go',
          function()
            require('gitportal').open_file_in_browser()
          end,
          { 'n', 'v' },
          desc = 'Open  GitHub link in browser',
        },
        {
          '<leader>gc',
          function()
            require('gitportal').copy_link_to_clipboard()
          end,
          { 'n', 'v' },
          desc = 'Copy  GitHub link in to system clipboard',
        },
      },
    },
  },
  {
    ---@url https://github.com/pwntester/octo.nvim
    ---@type LazyPluginSpec
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      picker = 'telescope',
    },
  },
  {
    ---@url https://github.com/rktjmp/paperplanes.nvim
    ---@type LazyPluginSpec
    'rktjmp/paperplanes.nvim',
    opts = {
      register = '+',
      provider = 'gist',
      provider_options = {
        command = 'gh',
      },
      notifier = vim.notify or print,
    },
  },
}
