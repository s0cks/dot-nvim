local function map(key, func, opts, mode)
  if type(func) ~= 'function' then
    func = function()
      require('gitportal')[func]()
    end
  end

  return {
    '<leader>G' .. key,
    func,
    mode or { 'n', 'v' },
    opts or {},
  }
end

---@type LazyPluginSpec
return {
  'trevorhauter/gitportal.nvim',
  version = '*',
  lazy = true,
  event = 'VeryLazy',
  opts = {},
  keys = function()
    return {
      map('o', 'open_file_in_browser', {
        desc = 'Open  GitHub link in browser',
      }),
      map('cp', 'copy_link_to_clipboard', {
        desc = 'Copy  GitHub link in to system clipboard',
      }),
    }
  end,
}
