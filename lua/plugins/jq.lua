---@class s0cks.JqOpts
---@field toggle? boolean Toggle from memory
---@field commands? table[] The list of commands to run
---@field arguments? string The list of arguments to use
---@field query? string The query to use

---@alias s0cks.JqCommand
---| 'jq'
---| 'yq'

--- Create a function to run JQ
---@param command s0cks.JqCommand the command to use
---@param filetype string The filetype to apply to
---@param opts? s0cks.JqOpts The options to apply
local jq = function(command, filetype, opts)
  opts = vim.tbl_deep_extend('force', {
    toggle = true,
    commands = {
      {
        command = command,
        filetype = filetype,
        arguments = '-r',
      },
    },
    arguments = '',
    query = '.',
  }, opts or {})

  return function()
    return require('jq').run({
      toggle = opts.toggle,
      commands = opts.commands,
      arguments = opts.arguments,
      query = opts.query,
    })
  end
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
    local map = require('utils').map_bft
    map('<leader>Jq', jq('jq', 'json'), {
      filetype = 'json',
      desc = 'Query json document using jq',
    })
    map('<leader>Yq', jq('yq', 'yaml'), {
      filetype = 'yaml',
      desc = 'Query yaml document using yq',
    })
  end,
}
