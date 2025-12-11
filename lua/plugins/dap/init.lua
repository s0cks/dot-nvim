---@url https://github.com/mfussenegger/nvim-dap
---@type LazyPluginSpec
return {
  'mfussenegger/nvim-dap',
  init = function()
    local dap = require('dap')
    require('plugins.dap.adapters')(dap)
    require('plugins.dap.configurations')(dap)
  end,
}
