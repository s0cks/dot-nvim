return {
  'google/executor.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
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
    statusline = {
      prefix = 'Executor: ',
      icons = {
        in_progress = '…',
        failed = '✖ ',
        passed = '✓',
      },
    },
    preset_commands = {
      ['/'] = {
        {
          partial = true,
          cmd = 'task ',
        },
        'task default',
      },
    },
  },
  keys = {
    {
      '<leader>ex',
      group = 'Executor',
    },
    {
      '<leader>exv',
      function()
        require('executor').commands.toggle_detail()
      end,
      'n',
      desc = 'Toggle executor details',
    },
    {
      '<leader>exh',
      function()
        require('executor').commands.show_history()
      end,
      'n',
      desc = 'Show executor history',
    },
    {
      '<leader>exp',
      function()
        require('executor').commands.show_presets()
      end,
      'n',
      desc = 'Show executor presets',
    },
    {
      '<leader>exo',
      function()
        require('executor').commands.run_one_off()
      end,
      'n',
      desc = 'Run executor w/ one off command',
    },
    {
      '<leader>exr',
      function()
        require('executor').commands.run()
      end,
      'n',
      desc = 'Run executor w/ previous command',
    },
    {
      '<leader>exR',
      function()
        require('executor').commands.run_with_new_command()
      end,
      'n',
      desc = 'Run executor w/ new command',
    },
    {
      '<leader>exT',
      function()
        local function exec_task(name)
          require('executor').commands.run_one_off('task ' .. name)
        end

        Snacks.input({
          prompt = 'Execute task',
        }, exec_task)
      end,
      'n',
      desc = 'Execute task using executor',
    },
  },
}
