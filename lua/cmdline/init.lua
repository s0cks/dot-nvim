local M = {}

---@class s0cks.CmdlineConfig
---@field height number The height of the cmdline
local default_config = {
  height = 1,
}

--- Setup the plugin
---@param opts? s0cks.CmdlineConfig The configuration
function M.setup(opts)
  opts = vim.tbl_deep_extend('force', default_config, opts or {})
  local group = vim.api.nvim_create_augroup('cmdline_height', {
    clear = true,
  })

  --- Set the height of the cmdline and redraw it
  ---@param val number The expected height of the cmdline
  local function set_height(val)
    if vim.opt.cmdheight:get() ~= val then
      vim.opt.cmdheight = val
      vim.cmd.redrawstatus()
    end
  end

  set_height(0)
  vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = group,
    callback = function()
      set_height(opts.height)
    end,
  })

  vim.api.nvim_create_autocmd('CmdlineChanged', {
    group = group,
    callback = function()
      if vim.fn.getcmdtype() == ':' and vim.fn.getcmdline() == '' then
        set_height(0)
      end
    end,
  })

  vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = group,
    callback = function()
      set_height(0)
    end,
  })
end

return M
