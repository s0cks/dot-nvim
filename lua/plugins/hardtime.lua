return {
  'm4xshen/hardtime.nvim',
  lazy = false,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim',
  },
  opts = {},
  init = function()
    local hardtime = require('hardtime')
    Snacks.toggle
      .new(
        ---@type snacks.toggle.Config
        {
          name = 'Hardtime',
          get = function()
            return hardtime.is_plugin_enabled
          end,
          set = function(state)
            (state and hardtime.enable or hardtime.disable)()
          end,
        }
      )
      :map('<leader>Th')
  end,
}
