---@return LazyPluginSpec
return {
  'quentingruber/pomodoro.nvim',
  version = '*',
  cmd = {
    'PomodoroStart',
    'PomodoroDelayBreak',
    'PomodoroSkipBreak',
    'PomodoroForceBreak',
    'PomodoroUI',
  },
  keys = {
    {
      '<leader>BS',
      ':PomodoroStart<cr>',
      { 'n', },
      {
        desc = "🍅 Start the pomodoro timer",
      },
    },
    {
      '<leader>Bs',
      ':PomodoroStop<cr>',
      { 'n', },
      {
        desc = "🍅 Stop the pomodoro timer",
      },
    },
  },
  opts = {
    start_at_launch = false,
    work_duration = 25,
    break_duration = 5,
    delay_duration = 1,
    long_break_duration = 15,
    breaks_before_long = 4,
    display_ui_on_break = true,
  },
}
