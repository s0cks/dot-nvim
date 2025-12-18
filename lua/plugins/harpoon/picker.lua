---@class harpoon.snacks.PickerOpts : snacks.picker.Config
local default_harpoon_picker_opts = {}

---@param opts? harpoon.snacks.PickerOpts
return function(opts)
  opts = vim.tbl_deep_extend('force', default_harpoon_picker_opts, opts or {})
  local ha_actions = require('plugins.harpoon.actions')
  local ha_finder = require('plugins.harpoon.finder')
  Snacks.picker.pick({
    source = 'harpoons',
    finder = ha_finder,
    title = 'Harpoons',
    format = 'text',
    layout = {
      preset = 'vertical',
    },
    win = {
      input = {
        keys = {
          ['dd'] = ha_actions.remove(),
        },
      },
      list = {
        keys = {
          ['dd'] = ha_actions.remove(),
        },
      },
    },
    confirm = ha_actions.goto(),
  })
end
