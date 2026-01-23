local presets = {
  ['/'] = {
    'task default',
    {
      partial = true,
      cmd = 'task ',
    },
  },
}

local LogLevel = vim.log.levels

---@type LazyPluginSpec
return {
  's0cks/executor.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'j-hui/fidget.nvim',
  },
  opts = {
    -- View details of the task run in a split, rather than a popup window.
    -- Set this to `false` to use a popup.
    use_split = true,

    -- Configure the split. These are ignored if you are using a popup.
    split = {
      -- One of "top", "right", "bottom" or "left"
      position = 'right',
      -- The number of columns to take up. This sets the split to 1/4 of the
      -- space. If you're using the split at the top or bottom, you could also
      -- use `vim.o.lines` to set this relative to the height of the window.
      size = math.floor(vim.o.columns * 1 / 4),
    },

    -- Configure the popup. These are ignored if you are using a split.
    popup = {
      -- Sets the width of the popup to 3/5ths of the screen's width.
      width = math.floor(vim.o.columns * 3 / 5),
      -- Sets the height to almost full height, allowing for some padding.
      height = vim.o.lines - 20,
      -- Border styles
      border = {
        padding = {
          top = 2,
          bottom = 2,
          left = 3,
          right = 3,
        },
        style = 'rounded',
      },
    },
    -- Filter output from commands. See *filtering_output* below for more
    output_filter = function(command, lines)
      return lines
    end,

    notifications = {
      -- Show a popup notification when a task is started.
      task_started = false,
      -- Show a popup notification when a task is completed.
      task_completed = false,
      -- Border styles
      border = {
        padding = {
          top = 0,
          bottom = 0,
          left = 1,
          right = 1,
        },
        style = 'rounded',
      },
    },
    statusline = nil,
    preset_commands = presets,
  },
  init = function()
    local fidget = require('fidget')
    vim.api.nvim_create_autocmd('User', {
      pattern = 'ExecutorRunStarted',
      callback = function()
        fidget.notify('Executor task started', LogLevel.INFO)
      end,
    })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'ExecutorRunFinished',
      callback = function()
        fidget.notify('Executor task finished', LogLevel.INFO)
      end,
    })
  end,

  keys = function()
    local executor = require('executor')
    local function map(keys, func, opts, mode)
      if type(func) ~= 'function' then
        if executor.commands[func] then
          func = executor.commands[func]
        end
      end

      return {
        '<leader>ex' .. keys,
        func,
        mode or 'n',
        opts or {},
      }
    end

    return {
      {
        '<leader>ex',
        group = 'Executor',
      },
      map('', 'toggle_detail', {
        desc = 'Toggle Executor details',
      }),
      map('p', 'show_presets', {
        desc = 'Show Executor presets',
      }),
      map('o', 'run_one_off', {
        desc = 'Run Executor w/ one off command',
      }),
      map('r', 'run', {
        desc = 'Run Executor w/ previous command',
      }),
      map('R', 'run_with_new_command', {
        desc = 'Run Executor w/ new command',
      }),
      map('h', 'show_history', {
        desc = 'Show Executor history',
      }),
      map('t', function()
        require('taskfile.picker').task_picker()
      end, {
        desc = 'Executor Taskfile task using Executor',
      }),
    }
  end,
}
