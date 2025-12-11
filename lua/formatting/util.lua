local M = {}

function M.format_current_buffer()
  require('conform').format({
    async = true,
    lsp_format = 'fallback',
  })
end

return M
