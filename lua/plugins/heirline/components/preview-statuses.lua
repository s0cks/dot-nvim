local MarkdownPreview = {
  update = {
    'BufEnter',
    'BufWrite',
    'CursorHold',
  },
  condition = function()
    return require('state.markdown-preview').enabled
  end,
  provider = function()
    return ''
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['gr'],
      bold = true,
    }
  end,
}

local TypstPreview = {
  update = {
    'BufEnter',
    'BufWrite',
    'CursorHold',
  },
  condition = function()
    return require('state.typst-preview').enabled
  end,
  provider = function()
    return ''
  end,
  hl = function()
    local colors = require('theme.colors')
    return {
      fg = colors['gr'],
      bold = true,
    }
  end,
}

return {
  MarkdownPreview,
}
