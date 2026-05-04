---@return vim.lsp.Config
return function()
  local make_default_capabilities = require('plugins.lsp.capabilities')
  local capabilities = make_default_capabilities()

  ---@type vim.lsp.Config
  return {
    capabilities = capabilities,
    settings = {
      yaml = {
        validate = true,
        completion = true,
        hover = true,
        schemaStore = {
          enable = false,
          url = '',
        },
        keyOrdering = true,
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
  }
end
