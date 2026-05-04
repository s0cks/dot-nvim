local ALL_ADAPTERS = {
  'lldb',
}

return function(dap)
  for _, adapter in ipairs(ALL_ADAPTERS) do
    dap.adapters[adapter] = require('plugins.dap.adapters.' .. adapter)
  end
end
