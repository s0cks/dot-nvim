return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      dap.adapters.lldb = require('plugins.debugger.adapters.lldb')
      dap.configurations.cpp = require('plugins.debugger.config.cpp')
      dap.configurations.c = require('plugins.debugger.config.c')
    end,
  },
}
