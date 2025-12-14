local function format_current_buffer()
  require('conform').format({
    async = true,
    lsp_format = 'fallback',
  })
end

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
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
      formatters = {
        ruff = {
          command = 'ruff',
          args = { 'format' },
        },
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
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_user_command('Format', format_current_buffer, { desc = ' Format current buffer' })

      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable format-on-save',
        bang = true,
      })

      vim.api.nvim_create_user_command('FormatEnable', function(args)
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Enable format-on-save',
      })
    end,
  },
}
