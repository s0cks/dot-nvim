return {
  'nvimtools/none-ls.nvim',
  version = '*',
  dependencies = {},
  opts = {},
  init = function()
    local nonels = require('null-ls')
    local no_really = {
      method = nonels.methods.DIAGNOSTICS,
      filetypes = { 'markdown', 'text' },
      generator = {
        fn = function(params)
          local diagnostics = {}
          for i, line in ipairs(params.content) do
            local col, end_col = line:find('really')
            if col and end_col then
              table.insert(diagnostics, {
                row = i,
                col = col,
                end_col = end_col + 1,
                source = 'no-really',
                message = "Don't use 'really'",
                severity = vim.diagnostic.severity.WARN,
              })
            end
          end
          return diagnostics
        end,
      },
    }
    nonels.register(no_really)
  end,
}
