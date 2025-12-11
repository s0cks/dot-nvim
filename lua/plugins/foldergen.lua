--- FolderGen - Text to folder structure generator
---@url https://github.com/NitroVim/foldergen.nvim
---@type LazyPluginSpec
return {
  'NitroVim/foldergen.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>Gfs',
      ':FolderGen<cr>',
      'n',
      desc = 'Generate folder structure from text',
    },
  },
  config = function()
    vim.api.nvim_create_user_command('FolderGen', function()
      require('foldergen').generate_from_text()
    end, {})
  end,
}
