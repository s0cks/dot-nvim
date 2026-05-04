local icons = require('theme.icons')
local icon_and_color = {
  js = {
    icon = icons.nodejs,
    color = 'blue',
  },
  sh = {
    icon = icons.sh,
    color = 'grey',
  },
  py = {
    icon = icons.python,
    color = 'green',
  },
  rb = {
    icon = icons.ruby,
    color = 'red',
  },
  lua = {
    icon = icons.lua,
    color = 'blue',
  },
}

local function icon_rule_for_extension(pattern, extension)
  return vim.tbl_deep_extend('force', {
    pattern = pattern,
  }, icon_and_color[extension])
end

return {
  preset = 'modern',
  triggers = {
    { '<auto>', mode = 'nixsotc' },
  },
  filter = function(mapping)
    return mapping.desc and mapping.desc ~= ''
  end,
  defer = function(ctx)
    return vim.list_contains({ 'd', 'y' }, ctx.operator) or vim.list_contains({ '<C-V>', 'V' }, ctx.mode)
  end,
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  win = {
    padding = { 0, 0 },
    title = true,
    title_pos = 'center',
    wo = {
      winblend = 35,
    },
  },
  layout = {
    width = { min = 20 },
    spacing = 3,
  },
  keys = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  icons = {
    breadcrumb = '󰶻',
    separator = '',
    group = '+',
    ellipsis = '',
    colors = true,
    keys = {
      Up = '󰁝',
      Down = '󰁅',
      Left = '󰁍',
      Right = '󰁔',
    },
    rules = {
      icon_rule_for_extension('node', 'js'),
      icon_rule_for_extension('nodejs', 'js'),
      icon_rule_for_extension('terminal', 'sh'),
      icon_rule_for_extension('lua', 'lua'),
      icon_rule_for_extension('ruby', 'rb'),
      icon_rule_for_extension('python', 'py'),
      icon_rule_for_extension('py', 'py'),
    },
  },
}
