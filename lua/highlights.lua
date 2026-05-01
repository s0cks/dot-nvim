return function()
  local palette = require('theme.colors')
  local function hl(scope, style, group)
    if type(style) == 'string' then
      style = {
        fg = palette[style],
      }
    elseif type(style) ~= 'table' then
      return
    end
    vim.api.nvim_set_hl(group or 0, scope, style)
  end

  hl('@variable.member.jsonnet', 'pu')
  hl('@variable.jsonnet', 'pu')
  hl('@number.jsonnet', 'tx')
  hl('@variable.parameter.jsonnet', 'pu')
  hl('@variable.builtin.jsonnet', 'pu-2')
  hl('@keyword.jsonnet', 'pu-2')
  hl('@function.jsonnet', 'ma')
  hl('@function.call.jsonnet', 'ma')
  hl('@boolean.jsonnet', 'pu-2')
  hl('@string.jsonnet', 'bl')
end
