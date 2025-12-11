local M = {}

function M:make_capabilities(capabilities)
  return {
    cmd = { 'cmake-language-server' },
    filetypes = { 'cmake' },
    root_markers = { 'CMakePresets.json', 'CMakeFile.txt', '.git', 'build', 'cmake' },
    init_options = {
      buildDirectory = 'build',
    },
  }
end

function M:make_settings(settings)
  --- TODO: @s0cks implement
  return settings
end

return M
