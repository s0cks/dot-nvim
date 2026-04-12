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
    opts = function()
      local types = require('luasnip.util.types')
      return {
        localKeys = {},
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
      }
    end,
    init = function()
      local cwd = vim.fn.getcwd()
      local cfg = vim.fn.stdpath('config')
      require('luasnip.loaders.from_vscode').lazy_load({
        paths = {
          --- ~/.config/nvim/
          cfg .. '/.vscode/snippets',
          cfg .. '/.snippets',
          --- cwd
          cwd .. '/.vscode/snippets',
          cwd .. '/.snippets',
        },
      })

      require('luasnip.loaders.from_lua').lazy_load({
        paths = {
          --- ~/.config/nvim
          cfg .. '/lua/snippets',
          --- cwd
          cwd .. '/lua/snippets',
        },
      })
    end,
  },
}
