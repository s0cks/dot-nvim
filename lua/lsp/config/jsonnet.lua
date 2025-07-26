local M = {}

-- function M:make_config(overrides)
--   return {
--     cmd = { 'jsonnet-language-server' },
--     filetypes = { 'jsonnet', 'libsonnet' },
--     root_markers = { 'jsonnetfile.json', '.git' },
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
