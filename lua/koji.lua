local M = {}

---@class koji.Opts : snacks.terminal.Opts
local default_opts = {
  interactive = true,
}

---@param opts? koji.Opts
function M.koji(opts)
  opts = vim.tbl_extend('force', default_opts, opts or {})
  Snacks.terminal.open('koji', opts --[[@as snacks.terminal.Opts ---]])
end

return M
