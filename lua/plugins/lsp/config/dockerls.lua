local M = {}

-- function M:make_config(overrides)
--   return {
--     cmd = { 'docker-langserver', '--stdio' },
--     filetypes = { 'dockerfile' },
--     root_markers = { 'Dockerfile' },
--   }
-- end

function M:make_capabilities(overrides)
  --- TODO: @s0cks implement
  return overrides
end

function M:make_settings(settings)
  --- TODO: @s0cks implement
  return settings
end

return M
