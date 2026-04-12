return {
  {
    'rmagatti/gx-extended.nvim',
    version = '*',
    opts = {
      log_level = vim.log.levels.DEBUG,
      enable_github_file_line = true,
    },
    keys = { 'gx' },
    config = function(_, opts)
      require('gx-extended').setup(opts)
    end,
  },
}
