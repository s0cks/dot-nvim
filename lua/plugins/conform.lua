local function format_current_buffer()
  require('conform').format({
    async = true,
    lsp_format = 'fallback',
  }, function(err, edited)
    require('fidget').notify('Formatted', vim.log.levels.INFO)
  end)
end

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    dependencies = {
      'folke/snacks.nvim',
      'j-hui/fidget.nvim',
    },
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
      default_format_opts = {
        lsp_format = 'fallback',
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500 }
      end,
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
      Snacks.toggle
        .new(
          ---@type snacks.toggle.Opts
          {
            id = 'autoformat',
            name = 'AutoFormat',
            get = function()
              return not vim.g.disable_autoformat
            end,
            set = function(state)
              vim.g.disable_autoformat = not state
            end,
          }
        )
        :map('<leader>Taf')
    end,
  },
}
