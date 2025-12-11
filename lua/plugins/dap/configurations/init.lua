local ALL_CONFIGURATIONS = {
  'c',
  'cpp',
}

return function(dap)
  for _, config in ipairs(ALL_CONFIGURATIONS) do
    dap.configurations[config] = require('plugins.dap.configurations.' .. config)
  end
end
