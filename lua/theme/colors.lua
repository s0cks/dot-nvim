local M = require('flexoki.palette').palette()

local function hl(fg, bg, bold, italic)
  return {
    fg = fg,
    bg = bg or nil,
    bold = bold or false,
    italic = italic or false,
  }
end

M.rainbow = {
  M['ma'],
  M['re'],
  M['or'],
  M['ye'],
  M['gr'],
  M['bl'],
  M['cy'],
  M['pu'],
}

local function fg_hl(fg)
  return hl(fg)
end

local function bg_hl(bg)
  return hl(nil, bg)
end

local function bold_hl(fg, bg)
  return hl(fg, bg, true)
end

local function italic_hl(fg, bg)
  return hl(fg, bg, false, true)
end

M['hl-bg'] = bg_hl(M['bg'])
M['hl-tx'] = fg_hl(M['tx'])
M['hl-tx2'] = fg_hl(M['tx2'])
M['hl-tx3'] = fg_hl(M['tx3'])
M['hl-tx-italic'] = italic_hl(M['tx'])
M['hl-pu'] = fg_hl(M['pu'])
M['hl-pu-italic'] = italic_hl(M['pu'])
M['hl-alert'] = bold_hl(M['re'])
M['hl-warning'] = bold_hl(M['ye'])
return M
