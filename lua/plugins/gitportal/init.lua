return {
  ---@url https://github.com/trevorhauter/gitportal.nvim
  ---@type LazyPluginSpec
  {
    'trevorhauter/gitportal.nvim',
    version = '*',
    lazy = true,
    init = function()
      local gp = require('gitportal')
      vim.keymap.set({ 'n', 'v' }, '<leader>gb', gp.open_file_in_browser, { desc = 'Open GitHub   link in browser' })
      vim.keymap.set({ 'n', 'v' }, '<leader>gc', gp.copy_link_to_clipboard, { desc = 'Copy GitHub   link' })
    end,
  },
}
