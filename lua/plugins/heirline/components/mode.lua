local c = require('flexoki.palette').palette()
return {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = 'N',
      no = 'N?',
      nov = 'N?',
      noV = 'N?',
      ['no\22'] = 'N?',
      niI = 'Ni',
      niR = 'Nr',
      niV = 'Nv',
      nt = 'Nt',
      v = 'V',
      vs = 'Vs',
      V = 'V_',
      Vs = 'Vs',
      ['\22'] = '^V',
      ['\22s'] = '^V',
      s = 'S',
      S = 'S_',
      ['\19'] = '^S',
      i = 'I',
      ic = 'Ic',
      ix = 'Ix',
      R = 'R',
      Rc = 'Rc',
      Rx = 'Rx',
      Rv = 'Rv',
      Rvc = 'Rv',
      Rvx = 'Rv',
      c = 'C',
      cv = 'Ex',
      r = '...',
      rm = 'M',
      ['r?'] = '?',
      ['!'] = '!',
      t = 'T',
    },
    mode_colors = {
      n = c['tx'],
      i = c['gr'],
      v = c['cy'],
      V = c['cy'],
      ['\22'] = c['cy'],
      c = c['or'],
      s = c['pu'],
      S = c['pu'],
      ['\19'] = c['pu'],
      R = c['or'],
      r = c['or'],
      ['!'] = c['re'],
      t = c['re'],
    },
  },
  provider = function(self)
    return self.mode_names[self.mode]
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return {
      fg = self.mode_colors[mode],
      bold = true,
    }
  end,
  update = {
    'ModeChanged',
    pattern = '*:*',
    callback = vim.schedule_wrap(function()
      vim.cmd([[redrawstatus]])
    end),
  },
}
