return {
  {
    'TobinPalmer/Tip.nvim',
    event = 'VimEnter',
    init = function()
      require('tip').setup(require('plugins.tip.config'))
    end,
  },
}
