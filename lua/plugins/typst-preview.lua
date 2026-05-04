return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {},
  keys = {
    {
      '<leader>tp',
      '<CMD>TypstPreview<CR>',
      'n',
      silent = true,
      desc = 'Open Typst live-preview',
    },
  },
  init = function()
    vim.api.nvim_create_user_command('OpenPdf', function()
      local filepath = vim.api.nvim_buf_get_name(0)
      if filepath:match('%.typ$') then
        local pdf_path = filepath:gsub('%.typ$', '.pdf')
        vim.system({ 'xdg-open', pdf_path })
      end
    end, {})

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'typst' },
      callback = function()
        local state = require('state.typst-preview')
        local map = vim.keymap.set
        local prefix = '<leader>typ'

        map('n', prefix, function()
          state:toggle()
        end, {
          desc = 'Toggle Typst Preview',
        })

        map('n', prefix .. 'X', function()
          state:disable()
        end, {
          desc = 'Stop Typst Preview',
        })
      end,
    })
  end,
}
