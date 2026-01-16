return {
  'mcauley-penney/visual-whitespace.nvim',
  event = 'ModeChanged *:[vV\22]',
  dependencies = {
    'folke/snacks.nvim',
  },
  opts = {
    enabled = true,
    highlight = { link = 'Visual', default = true },
    match_types = {
      space = true,
      tab = true,
      nbsp = true,
      lead = false,
      trail = false,
    },
    list_chars = {
      space = '·',
      tab = '↦',
      nbsp = '␣',
      lead = '‹',
      trail = '›',
    },
    fileformat_chars = {
      unix = '↲',
      mac = '←',
      dos = '↙',
    },
    ignore = { filetypes = {}, buftypes = {} },
  },
  init = function()
    vim.g._visual_whitespace_enabled = true
    Snacks.toggle
      .new(
        ---@type snacks.toggle.Config
        {
          name = 'Visual Whitespace',
          get = function()
            return vim.g._visual_whitespace_enabled
          end,
          set = function(state)
            require('visual-whitespace').toggle()
            vim.g._visual_whitespace_enabled = state
          end,
        }
      )
      :map('<leader>Tvw')
  end,
}
