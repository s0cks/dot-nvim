return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'trouble.nvim',
  },
  version = '*',
  opts = {
    open_cmd = 'new',
    default = {
      find = {
        cmd = 'rg',
      },
      replace = {
        cmd = 'sd',
      },
    },
    color_devicons = true,
    live_update = false, -- auto execute search again when you write to any file in vim
    lnum_for_results = true, -- show line number for search/replace results
    line_sep_start = '┌-----------------------------------------',
    result_padding = '¦  ',
    line_sep = '└-----------------------------------------',
    highlight = {
      ui = 'String',
      search = 'DiffChange',
      replace = 'DiffDelete',
    },
  },
  keys = function()
    local prefix = '<leader>sp'
    local spectre = require('spectre')
    local map = function(key, func, opts)
      if type(func) ~= 'function' then
        if type(func) ~= 'string' then
          func = tostring(func)
        end

        if spectre[func] ~= nil and type(spectre[func]) == 'function' then
          local spectre_func = spectre[func]
          func = function()
            spectre_func({
              select_word = opts.select_word,
            })
          end
        end
      end

      return {
        prefix .. key,
        func,
        opts.modes or { 'n', 'v' },
        desc = opts.desc,
      }
    end

    return {
      map('t', 'toggle', {
        desc = 'Toggle Spectre',
      }),
      map('v', 'open_visual', {
        desc = ' Search using Spectre',
      }),
      map('vw', 'open_visual', {
        select_word = true,
        desc = ' Search for the current word using Spectre',
      }),
      map('f', 'open_file_search', {
        desc = ' Search the current file using Spectre',
      }),
      map('fw', 'open_file_search', {
        select_word = true,
        desc = ' Search for the current word in the current file using Spectre',
      }),
    }
  end,
}
