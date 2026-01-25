return {
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    dependencies = {
      'rafamadriz/friendly-snippets',
      'nvim-treesitter/nvim-treesitter',
    },
    build = 'make install_jsregexp',
    opts = {
      snippet_paths = {
        vim.fn.stdpath('config') .. '/snippets',
        vim.fn.stdpath('config') .. '/lua/snippets',
        vim.fn.getcwd() .. '/.vscode/snippets',
        vim.fn.getcwd() .. '/.snippets',
        vim.fn.getcwd() .. '/lua/.snippets',
        vim.fn.getcwd() .. '/lua/snippets',
      },
      localKeys = {
        {
          filenameContains = { 'cc', 'cpp' },
          LocalKeys = {
            {
              key = '<leader>co',
              cmd = ":lua vim.notify('Hello World')",
              modes = { 'n' },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local ls = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load({
        paths = opts.snippet_paths,
      })
      require('luasnip.loaders.from_lua').load({
        paths = opts.snippet_paths,
      })
      local types = require('luasnip.util.types')
      ls.config.set_config({
        keep_roots = true,
        link_roots = true,
        link_children = true,
        update_events = 'TextChanged,TextChangedI',
        delete_check_events = 'TextChanged',
        history = true,
        enable_autosnippets = true,
        store_selection_keys = '<leader>',
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '●', 'Comment' } },
            },
          },
        },
      })
    end,
  },
}
