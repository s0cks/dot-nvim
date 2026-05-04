local function create_command_with_prefix(prefix, command)
  local cmd = {}
  table.insert(cmd, prefix)

  if type(command) == 'table' then
    for _, c in ipairs(command) do
      table.insert(cmd, c)
    end
  elseif command ~= nil then
    table.insert(cmd, command)
  end

  return cmd
end

---@alias executor.RawPresetCommand
---| string
---| table<string>

---@class executor.PresetCommand
---@field cmd string The command to use
---@field partial? boolean Whether or not this is a partial command
---@field filetype? string The filetype it should be available for

---@class executor.PresetOpts
---@field partial? boolean Whether or not this is a partial command
---@field filetype? string The filetype it should be available for

---@param command executor.RawPresetCommand The command
---@param opts executor.PresetOpts
---@return executor.PresetCommand
local function preset_command(command, opts)
  opts = opts or {}

  local cmd = ''
  if type(command) == 'table' then
    cmd = table.concat(command, ' ')
  elseif type(command) ~= 'string' then
    cmd = string(command)
  end

  return {
    cmd = cmd,
    partial = opts.partial,
    filetype = opts.filetype,
  }
end

---@class executor.PresetOpts
local default_typst_preset_opts = {
  filetype = 'typst',
  partial = true,
}

---@param cmd? executor.RawPresetCommand The Typst command
---@param opts? executor.PresetOpts
---@return executor.PresetCommand
local function typst_preset(cmd, opts)
  opts = vim.tbl_deep_extend('force', default_typst_preset_opts, opts or {})
  return preset_command(create_command_with_prefix('typst', cmd), opts)
end

---@class executor.PresetOpts
local default_task_preset_opts = {
  partial = true,
}

---@param cmd? executor.RawPresetCommand The Typst command
---@param opts? executor.PresetOpts
---@return executor.PresetCommand
local function task_preset(cmd, opts)
  opts = vim.tbl_deep_extend('force', default_task_preset_opts, opts or {})
  return preset_command(create_command_with_prefix('task', cmd), opts)
end

local presets = {
  ['/'] = {
    --- Taskfile
    task_preset(),
    task_preset({ 'default' }),
    --- Typst
    typst_preset(),
    typst_preset('compile'),
    typst_preset({ 'compile', 'index.typ' }),
  },
}

local function map_executor(func)
  return function()
    local executor = require('executor')
    if type(func) ~= 'function' then
      if executor.commands[func] then
        func = executor.commands[func]
      end
    end

    func()
  end
end

---@type LazyPluginSpec
return {
  's0cks/executor.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    -- View details of the task run in a split, rather than a popup window.
    -- Set this to `false` to use a popup.
    use_split = false,

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
    statusline = nil,
    preset_commands = presets,
  },
  keys = {
    {
      '<leader>ex',
      group = 'Executor',
    },
    {
      '<leader>ex',
      map_executor('toggle_detail'),
      'n',
      desc = ' Toggle executor details',
    },
    {
      '<leader>exp',
      map_executor('show_presets'),
      'n',
      desc = ' Show Executor presets',
    },
    {
      '<leader>exo',
      map_executor('run_one_off'),
      'n',
      desc = ' Run Executor w/ one off command',
    },
    {
      '<leader>exr',
      map_executor('run'),
      'n',
      desc = ' Run Executor w/ previous command',
    },
    {
      '<leader>exn',
      map_executor('run_with_new_command'),
      'n',
      desc = ' Run Executor w/ new command',
    },
    {
      '<leader>exh',
      map_executor('show_history'),
      'n',
      desc = ' Show Executor history',
    },
  },
}
