---@param self string The instance of string to check
---@param s string The expected prefix
string.starts_with = function(self, s)
  return self:find('^' .. s) ~= nil
end

---@param self string The instance of string to check
---@param s string The expected suffix
string.ends_with = function(self, s)
  return self:find(s .. '$') ~= nil
end
