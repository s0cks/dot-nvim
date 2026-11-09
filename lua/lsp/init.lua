local function get_default_capabilities()
  local caps = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  })

  local has_blink, blink = pcall(require, 'blink.cmp')
  if has_blink then
    caps = blink.get_lsp_capabilities(caps, false)
    caps.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
  end

  return caps
end

vim.lsp.config('*', {
  capabilities = get_default_capabilities(),
  root_markers = { '.git' },
})

-- TODO(@s0cks):
-- vim.lsp.enable('bashls')
-- vim.lsp.enable('css')
-- vim.lsp.enable('dartls')
-- vim.lsp.enable('haskell')
-- vim.lsp.enable('hyprlang')
-- vim.lsp.enable('jsonls')
-- vim.lsp.enable('pyright')
-- vim.lsp.enable('svelte')
-- vim.lsp.enable('ts_ls')
-- vim.lsp.enable('ttags')
-- vim.lsp.enable('glsl_analyzer')

vim.lsp.enable('asm')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
vim.lsp.enable('css')
vim.lsp.enable('dartls')
vim.lsp.enable('docker')
vim.lsp.enable('docker-compose')
vim.lsp.enable('ebnf')
vim.lsp.enable('gopls')
vim.lsp.enable('haskell')
vim.lsp.enable('hyprlang')
vim.lsp.enable('jsonnet')
vim.lsp.enable('kura')
vim.lsp.enable('lua_ls')
vim.lsp.enable('marksman')
vim.lsp.enable('mise')
vim.lsp.enable('ruff')
vim.lsp.enable('rumdl')
vim.lsp.enable('svelte')
vim.lsp.enable('systemd')
vim.lsp.enable('taskfile')
vim.lsp.enable('terraformls')
vim.lsp.enable('textlsp')
vim.lsp.enable('tinymist')
vim.lsp.enable('tombi')
vim.lsp.enable('typos_lsp')
vim.lsp.enable('vale')
vim.lsp.enable('zls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
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
  end,
  desc = 'Bind LSP actions',
})
