return {
  require('ui.comments.todo'),
  {
    ---@url https://github.com/chrisgrieser/nvim-origami
    ---@type LazyPluginSpec
    'chrisgrieser/nvim-origami',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>fj',
        function()
          require('origami').h()
        end,
        { 'n', 'v' },
        desc = ' Fold line',
      },
      {
        '<leader>fk',
        function()
          require('origami').l()
        end,
        { 'n', 'v' },
        desc = ' Unfold line',
      },
      {
        '<leader>f$',
        function()
          require('origami').dollar()
        end,
        { 'n', 'v' },
        desc = ' Unfold line recursively',
      },
    },
    opts = {
      foldKeymaps = {
        setup = false,
      },
    }, -- needed even when using default config
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 2
      vim.opt.foldcolumn = '1'
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.opt.fillchars.eob = ' '
      vim.opt.fillchars.foldstart = 'nf-fa-chevron_down'
      vim.opt.fillchars.foldstop = 'nf-fa-chevron_up'
    end,
  },
  {
    ---@url https://github.com/soemre/commentless.nvim
    ---@type LazyPluginSpec
    'soemre/commentless.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    cmd = 'Commentless',
    opts = {
      hide_following_blank_lines = true,
      foldtext = function(num_folded)
        return '(' .. num_folded .. ' lines)'
      end,
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
}
