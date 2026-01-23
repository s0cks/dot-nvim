return {
  {
    'yorickpeterse/nvim-pqf',
    version = '*',
    opts = {
      signs = {
        error = {
          text = 'E',
          hl = 'DiagnosticSignError',
        },
        warning = {
          text = 'W',
          hl = 'DiagnosticSignWarn',
        },
        info = {
          text = 'I',
          hl = 'DiagnosticSignInfo',
        },
        hint = {
          text = 'H',
          hl = 'DiagnosticSignHint',
        },
      },
      max_filename_length = 30,
      show_multiple_lines = true,
      filename_truncate_prefix = '.../..',
    },
  },
}
