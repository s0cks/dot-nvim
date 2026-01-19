return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  opts = {
    defaults = {
      dynamic_preview_title = true,
      prompt_prefix = ' ',
      mappings = {
        n = {
          ['q'] = require('telescope.actions').close,
        },
        i = {
          ['<C-u>'] = false,
        },
      },
    },
  },
  keys = function()
    local builtin = require('telescope.builtin')
    local TELESCOPE_MAP_PREFIX = '<leader>f'

    local function telescope_builtin(key, picker, opts)
      if type(picker) ~= 'function' then
        local picker_name = tostring(picker)
        picker = function()
          builtin[picker_name](require('theme.utils').get_telescope_theme())
        end
      end

      if not opts.noprefix then
        key = TELESCOPE_MAP_PREFIX .. key
      end

      return {
        key,
        picker,
        opts.mode or { 'n' },
        {
          silent = true,
          desc = opts.desc,
        },
      }
    end

    return {
      telescope_builtin('gr', 'live_grep', {
        desc = 'Search using live grep + Telescope 󰭎',
      }),
      telescope_builtin('c', 'commands', {
        desc = 'Search commands using Telescope 󰭎',
      }),
      telescope_builtin('ch', 'command_history', {
        desc = 'Search command history using Telescope 󰭎',
      }),
      telescope_builtin('ac', 'autocommands', {
        desc = 'Search autocommands using Telescope 󰭎',
      }),
      telescope_builtin('f', 'find_files', {
        desc = 'Search for files using Telescope 󰭎',
      }),
      telescope_builtin('qf', 'quickfix', {
        desc = 'Search quickfix using Telescope 󰭎',
      }),
      telescope_builtin('b', 'buffers', {
        desc = 'Search buffers using Telescope 󰭎',
      }),
      telescope_builtin('m', 'marks', {
        desc = 'Search marks using Telescope 󰭎',
      }),
      telescope_builtin('k', 'keymaps', {
        desc = 'Search keymaps using Telescope 󰭎',
      }),
      telescope_builtin('p', 'pickers', {
        desc = 'Search for Telescope 󰭎 pickers using Telescope 󰭎',
      }),
      telescope_builtin('ft', 'filetypes', {
        desc = 'Search filetypes using Telescope 󰭎',
      }),
      telescope_builtin('hl', 'highlights', {
        desc = 'Search for highlights using Telescope 󰭎',
      }),
      telescope_builtin('s', 'lsp_document_symbols', {
        desc = 'Search document symbols using Telescope 󰭎',
      }),
      telescope_builtin('S', 'lsp_workspace_symbols', {
        desc = 'Search workspace symbols using Telescope 󰭎',
      }),
      telescope_builtin('x', 'diagnostics', {
        desc = 'Search diagnostics using Telescope 󰭎',
      }),
      telescope_builtin('d', 'lsp_declarations', {
        desc = 'Search declarations using Telescope 󰭎',
      }),
      telescope_builtin('D', 'lsp_definitions', {
        desc = 'Search definitions using Telescope 󰭎',
      }),
      telescope_builtin('t', 'lsp_type_definitions', {
        desc = 'Search type definitions using Telescope 󰭎',
      }),
      telescope_builtin('r', 'lsp_references', {
        desc = 'Search references using Telescope 󰭎',
      }),
    }
  end,
}
