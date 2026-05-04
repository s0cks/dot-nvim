local function bind_lsp_actions()
  local bufmap = function(mode, lhs, rhs)
    local opts = { buffer = true }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Displays clipboardhover information about the symbol under the cursor
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

  -- Jump to the definition
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

  -- Jump to declaration
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

  -- Lists all the implementations for the symbol under the cursor
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

  -- Jumps to the definition of the type symbol
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

  -- Lists all the references
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

  -- Displays a function's signature information
  bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

  -- Renames all references to the symbol under the cursor
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

  -- Selects a code action available at the current cursor position
  bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

  -- Show diagnostics in a floating window
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

  -- Move to the previous diagnostic
  bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

  -- Move to the next diagnostic
  bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local providers_dir = vim.fn.stdpath('config') .. '/lua/plugins/lsp/config/'
local ignored_files = {}

local function is_ignored(file)
  for _, value in ipairs(ignored_files) do
    if value == file then
      return true
    end
  end
  return false
end

local function discover_server_configs()
  local files = vim.fn.readdir(providers_dir, [[v:val =~ '\.lua$']])
  local results = {}
  for _, provider_file in ipairs(files) do
    if not is_ignored(provider_file) then
      local provider_name = provider_file:sub(0, #provider_file - #'.lua')
      table.insert(results, provider_name)
    end
  end
  return results
end

return {
  'b0o/schemastore.nvim',
  ---@type LazyPluginSpec
  {
    'neovim/nvim-lspconfig',
    version = '*',
    dependencies = {
      'b0o/schemastore.nvim',
      'folke/neoconf.nvim',
    },
    opts = {
      servers = {
        lua_ls = {},
        bashls = {},
        ts_ls = {},
        jsonls = {},
        clangd = {},
        marksman = {},
        pyright = {},
        gopls = {},
        jsonnet = {},
        hyprlang = {},
        css = {},
        typos_lsp = {},
        tinymist = {},
        vale = {},
        yamlls = {},
      },
    },
    config = function(_, opts)
      vim.lsp.config('*', {
        capabilities = {
          textDocument = {
            semanticTokens = {
              multilineTokenSupport = true,
            },
          },
        },
        root_markers = { '.git' },
      })
      for name, _ in pairs(opts.servers or {}) do
        local server_config = require('plugins.lsp.config.' .. name)
        vim.lsp.config(name, server_config())
        vim.lsp.enable(name)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = bind_lsp_actions,
        desc = 'Bind LSP actions',
      })
    end,
  },
}
