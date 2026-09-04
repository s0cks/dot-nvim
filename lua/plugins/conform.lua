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

local ft_to_fmt = {
  toml = 'tombi',
  yaml = 'yamlfmt',
  xml = 'xmlstarlet',
  lua = 'stylua',
  json = 'fixjson',
  sh = 'shfmt',
  zsh = 'shfmt',
  bash = 'shfmt',
  python = 'ruff_format',
  jsonnet = 'jsonnetfmt',
  go = 'gofmt',
  css = 'stylelint',
  md = 'rumdl',
  markdown = 'rumdl',
  cpp = 'clang-format',
  zig = 'zigfmt',
  meson = {
    'meson',
    'format',
  },
}

local function getFormattersByFiletype()
  local results = {}
  for k in pairs(ft_to_fmt) do
    local formatter = ft_to_fmt[k]
    if type(formatter) == 'string' then
      results[k] = { formatter }
      results[k .. '.scratch'] = { formatter }
    elseif type(formatter) == 'table' then
      results[k] = formatter
      results[k .. '.scratch'] = formatter
    end
  end

  return results
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
      formatters_by_ft = getFormattersByFiletype(),
      format_on_save = format_on_save,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters = {
        jsonnetfmt = {
          '-i',
        },
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
