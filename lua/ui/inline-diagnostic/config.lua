return {
  preset = 'modern',
  transparent_bg = true,
  transparent_cursorline = true,
  hi = {
    error = 'DiagnosticError',
    warn = 'DiagnosticWarn', -- Highlight group for warning messages
    info = 'DiagnosticInfo', -- Highlight group for informational messages
    hint = 'DiagnosticHint', -- Highlight group for hint or suggestion messages
    arrow = 'NonText', -- Highlight group for diagnostic arrows
    background = 'CursorLine',
  },
  options = {
    multilines = {
      enabled = true,
      trim_whitespaces = true,
      tabstop = 2,
    },
    enable_on_insert = true,
    enable_on_select = true,
  },
}
