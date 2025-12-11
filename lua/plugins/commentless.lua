---@type LazyPluginSpec
return {
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
}
