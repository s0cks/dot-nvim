local ALL_PROVIDERS = {
  'git',
  -- TODO(@s0cks): #1 do something w/ this
  -- 'nerdfont',
  'gitmoji',
  'env',
  'emoji',
  'yank',
}

local M = {}

for _, provider in ipairs(ALL_PROVIDERS) do
  M[provider] = require('plugins.blink.providers.' .. provider)
end

return M
