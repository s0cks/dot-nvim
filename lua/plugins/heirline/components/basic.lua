local M = {}

function M.constant_provider(value)
  return { provider = value }
end

M.Space = M.constant_provider(' ')
M.Align = M.constant_provider('%=')

return M
