return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {},
  init = function()
    vim.api.nvim_create_user_command('OpenPdf', function()
      local filepath = vim.api.nvim_buf_get_name(0)
      if filepath:match('%.typ$') then
        local pdf_path = filepath:gsub('%.typ$', '.pdf')
        vim.system({ 'xdg-open', pdf_path })
      end
    end, {})
  end,
}
