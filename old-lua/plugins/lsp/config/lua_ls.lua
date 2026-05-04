---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  local function get_lazy_plugin_path(name)
    return vim.fn.stdpath('data') .. '/lazy/' .. name
  end

  local function get_workspace_library()
    local library = {
      vim.env.VIMRUNTIME,
      vim.fn.stdpath('config'),
    }

    for _, name in pairs({ 'lazy.nvim', 'blink.cmp', 'snacks.nvim' }) do
      table.insert(library, get_lazy_plugin_path(name))
    end

    return library
  end

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {
      Lua = {
        completion = {
          enable = true,
          callSnippet = 'Replace',
          keywordSnippet = 'Both',
          displayContext = 3,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        doc = {
          privateName = { '^_' },
        },
        hint = {
          enable = true,
          setType = true,
          paramType = true,
          paramName = 'Disable',
          semicolon = 'Disable',
          arrayIndex = 'Disable',
        },
        workspace = {
          checkThirdParty = false,
          library = get_workspace_library(),
        },
        telemetry = { enable = false },
      },
    },
  }
end
