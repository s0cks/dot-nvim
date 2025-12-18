---@return LazyPluginSpec
return {
  'cenk1cenk2/jq.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'grapp-dev/nui-components.nvim',
  },
  opts = {},
  init = function()
    local map = vim.keymap.set
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'json',
      callback = function()
        map('n', '<leader>Jq', function()
          require('jq').run({
            toggle = true,
            commands = {
              {
                command = 'jq',
                filetype = 'json',
                arguments = '-r',
              },
            },
            arguments = '',
            query = '.',
          })
        end, {
          buffer = true,
          desc = 'Query json document using jq',
        })
      end,
    })
  end,
}
