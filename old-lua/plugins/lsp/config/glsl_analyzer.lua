local M = {}

-- function M:make_config(overrides)
--   return {
--     cmd = { 'glsl_analyzer' },
--     filetypes = { 'glsl', 'vert', 'tesc', 'tese', 'frag', 'geom', 'comp' },
--     root_markers = { '.git' },
--     capabilities = {},
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
