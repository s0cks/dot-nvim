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

return M
