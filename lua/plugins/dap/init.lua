---TODO(@s0cks): https://github.com/LiadOz/nvim-dap-repl-highlights

---@type LazyPluginSpec
return {
  'mfussenegger/nvim-dap',
  init = function()
    local dap = require('dap')
    require('plugins.dap.adapters')(dap)
    require('plugins.dap.configurations')(dap)
  end,
}
