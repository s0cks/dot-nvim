local M = {}

--- Clone and install a vim plugin using git
---@param repo string The repository to clone
---@param dir string The directory to install to
function M.clone_and_add_to_rtp(repo, dir)
  if not repo:starts_with('http(s)?://') then
    repo = 'https://github.com/' .. repo
  end

  if not repo:ends_with('.git') then
    repo = repo .. '.git'
  end

  if not (vim.uv or vim.loop).fs_stat(dir) then
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, dir })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { 'Failed to clone ' .. repo .. ':\n', 'ErrorMsg' },
        { out, 'WarningMsg' },
        { '\nPress any key to exit...' },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(dir)
end

---@class s0cks.MapByFiletypeOpts
---@field filetype? string The filetype to create mappings for
---@field desc? string The description of the mapping

--- Create a mapping based on filetype
---@param key string The key to map
---@param cb function The function to apply
---@param opts? s0cks.MapByFiletypeOpts The options for the mapping
function M.map_bft(key, cb, opts)
  opts = vim.tbl_deep_extend('force', {
    filetype = '*',
    desc = '',
  }, opts or {})
  local map = vim.keymap.set
  vim.api.nvim_create_autocmd('FileType', {
    pattern = opts.filetype,
    callback = function()
      map('n', key, cb, {
        buffer = true,
        desc = opts.desc,
      })
    end,
  })
end

--- Append a table to another table
---@param dst table The dst table
---@param src table The src table
function M.append(dst, src)
  for _, elem in ipairs(src) do
    table.insert(dst, elem)
  end
end

---@alias AutocmdSpecEvents
---| string
---| table<string>

---@class AutocmdSpec
---@field [1] AutocmdSpecEvents test
---@field [2] string test

---@alias AutocmdSpecs
---| AutocmdSpec
---| table<AutocmdSpec>

---@param specs? AutocmdSpecs
function M.create_autocmds(specs)
  local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
  end

  if type(specs) ~= 'table' then
    specs = { specs }
  end

  for _, spec in ipairs(specs) do
    ---@type AutocmdSpecEvents
    local autocmd_events = spec[1]
    if type(autocmd_events) ~= 'table' then
      autocmd_events = { tostring(autocmd_events) }
    end

    vim.api.nvim_create_autocmd(autocmd_events, {
      group = augroup(spec[2]),
      callback = spec[3],
    })
  end
end

return M
