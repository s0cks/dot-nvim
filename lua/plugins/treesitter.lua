return {
  {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {},
    opts = {
      languages = {
        kura = {
          install_info = {
            url = 'https://github.com/s0cks/tree-sitter-kura.git',
            files = { 'src/parser.c' },
            queries = 'queries/kura',
          },
          filetype = 'kura',
        },
      },
    },
    init = function()
      vim.filetype.add({
        extension = {
          ebnf = 'ebnf',
          kui = 'kura',
        },
      })

      local config = require('nvim-treesitter.parsers').get_parser_configs()
      config.kura = {}
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
