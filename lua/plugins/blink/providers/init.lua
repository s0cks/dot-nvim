local ALL_PROVIDERS = {
  'git',
  'nerdfont',
  'gitmoji',
  'env',
  'emoji',
}

local M = {}

for _, provider in ipairs(ALL_PROVIDERS) do
  M[provider] = require('plugins.blink.providers.' .. provider)
end

return M
