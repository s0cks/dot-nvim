local palette = require('flexoki.palette').palette()

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {
      'dashboard',
      'snacks_dashboard',
      'alpha',
      'NvimTree',
      'neo-tree',
      'lspinfo',
    },
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {
        c = {
          fg = palette.tx,
          bg = palette.bg,
        },
      },
      inactive = {
        c = {
          fg = palette.tx,
          bg = palette.bg,
        },
      },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return '▊'
  end,
  color = {
    fg = palette.bl,
  }, -- Sets highlighting of component
  padding = {
    left = 0,
    right = 1,
  }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = palette.re,
      i = palette.gr,
      v = palette.bl,
      [''] = palette.bl,
      V = palette.bl,
      c = palette.pu,
      no = palette.re,
      s = palette.ye,
      S = palette.ye,
      [''] = palette.ye,
      ic = palette.ye,
      R = palette.pu,
      Rv = palette.pu,
      cv = palette.re,
      ce = palette.re,
      r = palette.bl,
      rm = palette.bl,
      ['r?'] = palette.bl,
      ['!'] = palette.re,
      t = palette.re,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
})

ins_left({
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
})

ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
  color = {
    fg = palette.tx2,
    gui = 'bold',
  },
})

ins_left({ 'location' })

ins_left({
  'progress',
  color = {
    fg = palette.tx,
    gui = 'bold',
  },
})

ins_left({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = palette.re },
    warn = { fg = palette.ye },
    info = { fg = palette.tx2 },
  },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
  function()
    return '%='
  end,
})

ins_left({
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = palette.text, gui = 'bold' },
})

ins_right({
  'executor',
  icon = '',
  color = function()
    local c = require('flexoki.palette').palette()
    local status = require('executor').current_status()
    if status == 'IN_PROGRESS' then
      return c.pu
    elseif status == 'PASSED' then
      return c.gr
    elseif status == 'FAILED' then
      return c.re
    else
      return c.tx2
    end
  end,
})
-- Add components to right sections
ins_right({
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = palette.gr, gui = 'bold' },
})

ins_right({
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = palette.gr, gui = 'bold' },
})

ins_right({
  'branch',
  icon = '',
  color = { fg = palette.ye, gui = 'bold' },
})

ins_right({
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = palette.gr },
    modified = { fg = palette.ye },
    removed = { fg = palette.re },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return '▊'
  end,
  color = { fg = palette.bl },
  padding = { left = 1 },
})

return config
