return {
  {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {},
    opts = {
      -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
      -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
      -- auto_install = false, -- if enabled, install missing parsers when editing a new file
      -- highlight = true, -- treesitter highlighting is enabled by default
      -- languages = {}, -- override or add new parser sources
      -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
      -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
    },
    init = function()
      vim.filetype.add({
        extension = {
          ebnf = 'ebnf',
        },
      })

      local config = require('nvim-treesitter.parsers').get_parser_configs()
      config.ebnf = {
        install_info = {
          url = 'https://github.com/RubixDev/ebnf.git',
          files = {
            'src/parser.c',
          },
          location = 'crates/tree-sitter-ebnf',
          branch = 'main',
        },
        filetype = 'ebnf',
      }
    end,
  },
  {
    'RubixDev/ebnf',
    rtp = 'crates/tree-sitter-ebnf',
  },
}
