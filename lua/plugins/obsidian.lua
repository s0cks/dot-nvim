local vault_dir = vim.env.OBSIDIAN_VAULT_DIR
if not vault_dir then
  vault_dir = vim.fn.expand('~') .. '/Obsidian'
end

local function get_workspaces()
  local workspaces = {}

  if vim.fn.isdirectory(vault_dir) ~= 1 then
    return workspaces
  end

  local stream = vim.fn.readdir(vault_dir)
  if stream then
    for _, entry in ipairs(stream) do
      table.insert(workspaces, {
        name = entry,
        path = vault_dir .. '/' .. entry,
      })
    end
  end

  return workspaces
end

return {
  ---@type LazyPluginSpec
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    cmd = 'Obsidian',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = get_workspaces(),
      completion = {
        blink = true,
      },
      picker = {
        name = 'fzf-lua',
      },
      ui = {
        ignore_conceal_warn = true,
      },
    },
  },
}
