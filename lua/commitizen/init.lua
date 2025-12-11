local M = {}

function M.open()
  require('kitty').launch({ 'git', 'cz' })
end

return M
