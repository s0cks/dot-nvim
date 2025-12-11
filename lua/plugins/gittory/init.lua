return {
  {
    'IsWladi/Gittory',
    version = '*',
    dependencies = {
      'j-hui/fidget.nvim',
    },
    opts = {
      atStartUp = true,
      notifySettings = {
        enabled = true,
        availableNotifyPlugins = { 'fidget', 'print' },
      },
    },
  },
}
