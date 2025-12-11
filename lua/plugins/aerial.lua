return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'folke/snacks.nvim',
  },
  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '[', '<cmd>AerialPrev<cr>', { buffer = bufnr })
      vim.keymap.set('n', ']', '<cmd>AerialNext<cr>', { buffer = bufnr })
    end,
  },
  init = function()
    local aerial = require('aerial')
    Snacks.toggle
      .new(
        ---@type snacks.toggle.Opts
        {
          id = 'aerial',
          name = 'Aerial',
          get = function()
            return aerial.is_open(0)
          end,
          set = function(state)
            (state and aerial.open or aerial.close)()
          end,
        }
      )
      :map('<leader>Ta')
  end,
}
