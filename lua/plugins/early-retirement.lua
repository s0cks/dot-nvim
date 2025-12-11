return {
  'chrisgrieser/nvim-early-retirement',
  event = 'VeryLazy',
  opts = {
    defaultOpts = {
      retirementAgeMins = 5,
      ignoredFiletypes = {},
      ignoreUnsavedChangesBufs = true,
      ignoreSpecialBuftypes = true,
      ignoreVisibleBufs = true,
      notificationOnAutoClose = false,
      minimumBufferNum = 3,
    },
  },
}
