local M = {}
--
-- function M:make_config(overrides)
--   return {
--     cmd = { 'docker-compose-langserver', '--stdio' },
--     filetypes = { 'yaml.docker-compose' },
--     root_markers = { 'docker-compose.yaml', 'docker-compose.yml', 'compose.yaml', 'compose.yml' },
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
