local if_nil = vim.F.if_nil

local default_terminal = {
  type = 'terminal',
  command = nil,
  width = 69,
  height = 8,
  opts = {
    redraw = true,
    window_config = {},
  },
}

local default_header = {
  type = 'text',
  val = {
    [[                                  __]],
    [[     ___     ___    ___   __  __ /\_\    ___ ___]],
    [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
    [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
    [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  },
  opts = {
    position = 'center',
    hl = 'DashboardHeader',
  },
}

local footer = {
  type = 'text',
  val = '',
  opts = {
    position = 'center',
    hl = 'DashboardFooter',
  },
}

local leader = ','

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

  local opts = {
    position = 'center',
    shortcut = sc,
    cursor = 3,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'DashboardShortcut',
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { 'n', sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = 'group',
  val = {
    button('e', '  New file', '<cmd>ene <CR>'),
    button(leader .. 'ff', '󰈞  Find file'),
    button(leader .. 'fgr', '󰈬  Find word'),
    button(leader .. 'fm', '  Jump to bookmarks'),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  terminal = default_terminal,
  header = default_header,
  buttons = buttons,
  footer = footer,
}

local config = {
  layout = {
    { type = 'padding', val = 2 },
    section.header,
    { type = 'padding', val = 2 },
    section.buttons,
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

return {
  {
    'goolord/alpha-nvim',
    version = '*',
    opts = {
      button = button,
      section = section,
      config = config,
      -- theme config
      leader = leader,
      -- deprecated
      opts = config,
    },
    config = function(_, opts)
      require('alpha').setup(opts.config)
      local palette = require('theme.colors')
      vim.api.nvim_set_hl(0, 'DashboardHeader', palette['hl-pu'])
      vim.api.nvim_set_hl(0, 'DashboardFooter', palette['hl-pu'])
      vim.api.nvim_set_hl(0, 'DashboardShortcut', palette['hl-pu'])
    end,
  },
}
