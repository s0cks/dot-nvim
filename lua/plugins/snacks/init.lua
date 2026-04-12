---@type LazyPluginSpec
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scope = {},
    image = {},
    picker = {},
    statuscolumn = {},
    toggle = {
      enabled = true,
      which_key = true,
    },
    gh = {},
    git = {},
    input = {},
    words = {},
    win = {},
    gitbrowse = {},
  },
  keys = {
    {
      '<leader>flp',
      function()
        Snacks.picker.lazy()
      end,
      'n',
      desc = 'Find LazyPluginSpec',
    },
  },
  init = function()
    vim.is_testing = false
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle
          .option('relativenumber', {
            name = 'Relative Number',
          })
          :map('<leader>uL')
      end,
    })
  end,
}
