-- local function load_presets()
--   local p = vim.fn.expand('%:p:h') .. '/executor-presets.json'
--   local file = io.open(p, 'r')
--   if not file then
--     error("couldn't open file: " .. p)
--   end
--
--   local content = file:read('*a')
--   file:close()
--
--   local success, decoded_json = pcall(vim.json.decode, content)
--   if not success then
--     error('failed to decode json: ' .. decoded_json)
--     return nil
--   end
--   return decoded_json
-- end

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

    return {
      {
        '<leader>ex',
        group = 'Executor',
      },
      {
        '<leader>ex',
        function()
          executor.commands.toggle_detail()
        end,
        'n',
        desc = 'Toggle executor details',
      },
      {
        '<leader>exp',
        function()
          executor.commands.show_presets()
        end,
        'n',
        desc = 'Show executor presets',
      },
      {
        '<leader>exo',
        function()
          executor.commands.run_one_off()
        end,
        'n',
        desc = 'Run executor w/ one off command',
      },
      {
        '<leader>exr',
        function()
          executor.commands.run()
        end,
        'n',
        desc = 'Run executor w/ previous command',
      },
      {
        '<leader>exR',
        function()
          executor.commands.run_with_new_command()
        end,
        'n',
        desc = 'Run executor w/ new command',
      },
      {
        '<leader>ext',
        function()
          require('taskfile.picker').task_picker()
        end,
        'n',
        desc = 'Execute Taskfile task using executor',
      },
      {
        '<leader>exh',
        function()
          executor.commands.show_history()
        end,
        'n',
        desc = 'Show executor history',
      },
    }
  end,
}
