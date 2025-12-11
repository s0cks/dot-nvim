return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    triggers = {
      { '<auto>', mode = 'nixsotc' },
      { 'a', mode = { 'n', 'v' } },
    },
    icons = {
      rules = {
        { pattern = 'python', icon = '', color = 'green' },
        { pattern = 'nodejs', icon = '', color = 'green' },
        { pattern = 'terminal', icon = '', color = 'white' },
        { pattern = 'lua', icon = '', color = 'blue' },
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false, loop = true })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
