local make_default_capabilities = require('lsp.capabilities')
local capabilities = make_default_capabilities()

return {
  {
    'b0o/schemastore.nvim',
    config = function()
      vim.lsp.config('jsonls', {
        cmd = { 'json-language-server', '--stdio' },
        filetypes = { 'json' },
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas({
              extra = {},
            }),
          },
        },
      })
      vim.lsp.enable('jsonls')

      vim.lsp.config('yamlls', {
        cmd = { 'yaml-language-server', '--stdio' },
        capabilities = capabilities,
        filetypes = { 'yaml' },
        settings = {
          yaml = {
            validate = true,
            completion = true,
            hover = true,
            schemaStore = {
              enable = false,
              url = '',
            },
            keyOrdering = false,
            hoverSchemaSource = true,
            format = {
              enable = true,
              proseWrap = 'Always',
            },
            schemas = require('schemastore').yaml.schemas({
              extra = {
                {
                  description = 'Hayagriva bibliography formatted yaml',
                  fileMatch = 'bibliography.yml',
                  name = 'Hayagriva Bibliography',
                  url = vim.fn.stdpath('config') .. '/schemas/hayagriva.json',
                },
              },
            }),
          },
        },
      })
      vim.lsp.enable('yamlls')
    end,
  },
}
