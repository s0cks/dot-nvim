---@param opts any
return function(_, opts)
  local ctactions = require('cheatsheet.telescope.actions')
  return {
    bundled_cheetsheets = {
      enabled = { 'default', 'lua', 'markdown', 'regex', 'netrw', 'unicode' },
      disabled = { 'nerd-fonts' },
    },
    telescope_mappings = {
      ['<CR>'] = ctactions.select_or_fill_commandline,
      ['<A-CR>'] = ctactions.select_or_execute,
      ['<C-Y>'] = ctactions.copy_cheat_value,
      ['<C-E>'] = ctactions.edit_user_cheatsheet,
    },
  }
end
