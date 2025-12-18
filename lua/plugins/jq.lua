local utils = require('utils')

local jq = require('jq')
local jq_run = function(commands, query, args, toggle)
  jq.run({
    toggle = toggle or true,
    commands = commands or {},
    arguments = args or '',
    query = query or '.',
  })
end

---@return LazyPluginSpec
return {
  'cenk1cenk2/jq.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'grapp-dev/nui-components.nvim',
  },
  opts = {},
  init = function()
    utils.map_bft('json', '<leader>Jq', function()
      jq_run({
        command = 'jq',
        filetype = 'json',
        arguments = '-r',
      })
    end, 'Query json document using jq')
    utils.map_bft('yaml', '<leader>Yq', function()
      jq_run({
        command = 'yq',
        filetype = 'yaml',
        arguments = '-r',
      })
    end, 'Query yaml document using yq')
  end,
}
