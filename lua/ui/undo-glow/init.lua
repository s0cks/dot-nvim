return {
  'y3owk1n/undo-glow.nvim',
  version = '*',
  opts = require('ui.undo-glow.config'),
  keys = require('ui.undo-glow.keys'),
  init = function()
    vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      callback = function()
        require('undo-glow').yank()
      end,
    })

    -- This only handles neovim instance and do not highlight when switching panes in tmux
    vim.api.nvim_create_autocmd('CursorMoved', {
      desc = 'Highlight when cursor moved significantly',
      callback = function()
        require('undo-glow').cursor_moved({
          animation = {
            animation_type = 'slide',
          },
        })
      end,
    })

    -- This will handle highlights when focus gained, including switching panes in tmux
    vim.api.nvim_create_autocmd('FocusGained', {
      desc = 'Highlight when focus gained',
      callback = function()
        ---@type UndoGlow.CommandOpts
        local opts = {
          animation = {
            animation_type = 'slide',
          },
        }

        opts = require('undo-glow.utils').merge_command_opts('UgCursor', opts)
        local pos = require('undo-glow.utils').get_current_cursor_row()

        require('undo-glow').highlight_region(vim.tbl_extend('force', opts, {
          s_row = pos.s_row,
          s_col = pos.s_col,
          e_row = pos.e_row,
          e_col = pos.e_col,
          force_edge = opts.force_edge == nil and true or opts.force_edge,
        }))
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
