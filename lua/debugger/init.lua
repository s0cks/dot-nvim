return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      dap.adapters.lldb = require('debugger.adapters.lldb')
      dap.configurations.cpp = require('debugger.config.cpp')
      dap.configurations.c = require('debugger.config.c')
    end,
  },
}
