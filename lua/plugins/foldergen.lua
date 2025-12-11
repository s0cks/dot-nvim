---@type LazyPluginSpec
return {
  'NitroVim/foldergen.nvim',
  cmd = 'FolderGen',
  opts = {},
  keys = {
    {
      '<leader>Gfs',
      '<cmd>FolderGen<cr>',
      'n',
      desc = 'Generate folder structure from text',
    },
  },
  init = function()
    vim.api.nvim_create_user_command('FolderGen', function()
      require('foldergen').generate_from_text()
    end, {})
  end,
}
