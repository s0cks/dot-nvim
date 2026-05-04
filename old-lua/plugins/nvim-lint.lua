local function try_lint_current_buffer()
  local lint = require('lint')
  if vim.bo.modifiable then
    lint.try_lint()
  end
end

return {
  {
    'mfussenegger/nvim-lint',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    opts = {
      linters_by_ft = {
        -- TODO(@s0cks): re-implement vale, it keeps crashing
        -- text = { 'vale' },
        -- markdown = { 'vale' },
        json = { 'jsonlint' },
        dockerfile = { 'hadolint' },
        terraform = { 'tflint' },
        lua = { 'luacheck' },
        zsh = { 'zsh' },
        sh = { 'shellcheck' },
        bash = { 'shellcheck' },
        python = { 'ruff' },
      },
    },
    config = function()
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = try_lint_current_buffer,
      })

      vim.api.nvim_create_user_command('Lint', try_lint_current_buffer, { desc = 'Lint the current bufer' })
    end,
  },
}
