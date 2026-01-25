local colors = require('theme.colors')

local function hl(name, color)
  if colors[color] then
    color = colors[color]
  end

  return {
    hl = name,
    hl_color = { bg = color },
  }
end

return {
  'y3owk1n/undo-glow.nvim',
  version = '*',
  dependencies = {
    'kepano/flexoki-neovim',
  },
  opts = {
    animation = {
      enabled = true,
    },
    highlights = {
      undo = hl('UgUndo', 're'),
      redo = hl('UgRedo', 'gr'),
      yank = hl('UgYank', 'ye'),
      paste = hl('UgPaste', 'cy'),
      search = hl('UgSearch', 'pu'),
      comment = hl('UgComment', 'pu'),
      cursor = hl('UgCursor', 'ma'),
    },
  },
  keys = function()
    local ug = require('undo-glow')
    local search_anim = {
      animation = {
        animation_type = 'strobe',
      },
    }

    local function map(key, func, opts)
      opts = vim.tbl_deep_extend('force', {
        noremap = true,
        mode = 'n',
      }, opts or {})

      if type(func) ~= 'function' then
        func = tostring(func)
        if ug[func] ~= nil and type(ug[func]) == 'function' then
          func = ug[func]
        end
      end

      return {
        key,
        func,
        mode = opts.mode,
        desc = opts.desc,
      }
    end

    local function map_search(key, func, opts)
      opts = vim.tbl_deep_extend('force', {
        animation = search_anim,
      }, opts or {})

      if type(func) ~= 'function' then
        func = tostring(func)
        if ug[func] ~= nil and type(ug[func]) == 'function' then
          func = ug[func]
        end
      end

      return map(key, func, opts)
    end

    return {
      map('u', 'undo', {
        desc = 'Undo',
      }),
      map('U', 'redo', {
        desc = 'Redo',
      }),
      map('p', 'paste_below', {
        desc = 'Paste below',
      }),
      map('P', 'paste_above', {
        desc = 'Paste above',
      }),
      map_search('n', 'search_next', {
        desc = 'Search next',
      }),
      map_search('N', 'search_previous', {
        desc = 'Search previous',
      }),
      map_search('*', 'search_star', {
        desc = 'Start search',
      }),
      map_search('#', 'search_hash', {
        desc = 'Hash search',
      }),
      map('gc', function()
        --- preserve the cursor pos
        local pos = vim.fn.getpos('.')
        vim.schedule(function()
          vim.fn.setpos('.', pos)
        end)

        return require('undo-glow').comment()
      end, {
        desc = 'Toggle comment',
      }),
      map('gc', 'comment_textobject', {
        desc = 'Toggle textobject comment',
        mode = 'o',
      }),
      map('gcc', 'comment_line', {
        desc = 'Toggle line comment',
        expr = true,
      }),
    }
  end,
  init = function()
    vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      callback = function()
        require('undo-glow').yank()
      end,
    })

    vim.api.nvim_create_autocmd('CmdLineLeave', {
      pattern = { '/', '?' },
      desc = 'Highlight when search cmdline leave',
      callback = function()
        require('undo-glow').search_cmd({
          animation = {
            animation_type = 'fade',
          },
        })
      end,
    })
  end,
}
