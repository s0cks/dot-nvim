local function on_formatted(err, edited)
  local fidget = require('fidget')
  if err then
    return fidget.notify('Failed to format: ' .. err, vim.log.levels.ERROR)
  end
  return fidget.notify('Formatted', vim.log.levels.INFO)
end

---@param opts? conform.FormatOpts The formatter options
---@param cb? fun(err: nil|string, edited: nil|boolean) Called once formatted is finished
local function format_current_buffer(opts, cb)
  opts = vim.tbl_deep_extend('force', {
    async = true,
    lsp_format = 'fallback',
  }, opts or {})
  require('conform').format(opts, cb or on_formatted)
end

local function format_on_save(bufnr)
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return nil
  end

  return { timeout_ms = 500 }
end

local function clang_format_style()
  local shiftwidth = vim.o.shiftwidth
  local expandtab = vim.o.expandtab
  local style = '{BasedOnStyle: Google, '
  style = style .. 'IndentWidth: ' .. shiftwidth
  if expandtab then
    style = style .. ', TabWidth: ' .. shiftwidth
    style = style .. ', UseTabs: Always'
  end
  return style .. '}'
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
        toml = { 'tombi' },
        ['toml.scratch'] = { 'tombi' },
        yaml = { 'yamlfmt' },
        ['yaml.scratch'] = { 'yamlfmt' },
        xml = { 'xmlstarlet' },
        ['xml.scratch'] = { 'xmlstarlet' },
        lua = { 'stylua' },
        ['lua.scratch'] = { 'stylua' },
        json = { 'fixjson' },
        ['json.scratch'] = { 'fixjson' },
        sh = { 'shfmt' },
        ['sh.scratch'] = { 'shfmt' },
        zsh = { 'shfmt' },
        ['zsh.scratch'] = { 'shfmt' },
        bash = { 'shfmt' },
        ['bash.scratch'] = { 'shfmt' },
        python = { 'ruff_format' },
        ['python.scratch'] = { 'ruff_format' },
        jsonnet = { 'jsonnetfmt' },
        ['jsonnet.scratch'] = { 'jsonnetfmt' },
        css = { 'stylelint' },
        ['css.scratch'] = { 'stylelint' },
        md = { 'rumdl' },
        ['md.scratch'] = { 'rumdl' },
        markdown = { 'rumdl' },
        ['markdown.scratch'] = { 'rumdl' },
        cpp = { 'clang-format' },
        ['cpp.scratch'] = { 'clang-format' },
      },
      format_on_save = format_on_save,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters = {
        clang_format = {
          prepend_args = {
            '--style=file',
            '--fallback-style=' .. clang_format_style(),
          },
        },
        shfmt = {
          prepend_args = {
            '-i',
            '4',
          },
        },
      },
    },
    keys = {
      {
        '<leader>F',
        function()
          return format_current_buffer()
        end,
        'n',
        desc = 'Format current buffer',
      },
    },
    init = function()
      vim.api.nvim_create_user_command('Format', function()
        format_current_buffer()
      end, { desc = ' Format current buffer' })
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
