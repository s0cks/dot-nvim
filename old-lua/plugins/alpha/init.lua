return {
  {
    'goolord/alpha-nvim',
    version = '*',
    dependencies = {
      'iAmWayward/Neoquotes',
    },
    config = function()
      require('alpha').setup(require('plugins.alpha.config'))
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'alpha',
        callback = function()
          vim.cmd('setlocal noma ro nonu nornu nolist')
        end,
      })
      local palette = require('theme.colors')
      vim.api.nvim_set_hl(0, 'DashboardHeader', palette['hl-pu'])
      vim.api.nvim_set_hl(0, 'DashboardFooter', palette['hl-pu'])
      vim.api.nvim_set_hl(0, 'DashboardShortcut', palette['hl-pu'])
    end,
  },
}
