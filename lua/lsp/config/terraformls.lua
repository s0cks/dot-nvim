local M = {}

-- function M:make_config(overrides)
--   return {
--     cmd = { 'terraform-ls', 'serve' },
--     filetypes = { 'terraform', 'terraform-vars' },
--     root_markers = { '.terraform', '.git' },
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
