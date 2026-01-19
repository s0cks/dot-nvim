local function format_current_buffer()
  require('conform').format({
    async = true,
    lsp_format = 'fallback',
  }, function(err, edited)
    require('fidget').notify('Formatted', vim.log.levels.INFO)
  end)
end

local function format_on_save(bufnr)
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return nil
  end
  return { timeout_ms = 500 }
end

return {
  {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    dependencies = {
      'folke/snacks.nvim',
      'j-hui/fidget.nvim',
    },
    event = 'VeryLazy',
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        json = { 'fixjson' },
        zsh = { 'shfmt' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        python = { 'ruff_format' },
      },
      format_on_save = format_on_save,
      default_format_opts = {
        lsp_format = 'fallback',
      },
    },
    keys = {
      {
        '<leader>F',
        format_current_buffer,
        'n',
        desc = 'Format current buffer',
      },
    },
    init = function()
      vim.api.nvim_create_user_command('Format', format_current_buffer, { desc = ' Format current buffer' })
      vim.g.disable_autoformat = false
      local toggles = require('toggles')
      toggles
        .new_buffer_toggle('disable_autoformat', 'AutoFormat', {
          negated = true,
        })
        :map('<leader>Taf')
    end,
  },
}
