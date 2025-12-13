--- Check whether a string starts with another string
---@param self string The string instance
---@param s string The expected starting string
---@return boolean true if self starts w/ s, otherwise false
string.starts_with = function(self, s)
  return self:find('^' .. s) ~= nil
end

--- Check whether a string ends with another string
---@param self string The string instance
---@param s string The expected ending string
---@return boolean true if self ends w/ s, otherwise false
string.ends_with = function(self, s)
  return self:find(s .. '$') ~= nil
end
