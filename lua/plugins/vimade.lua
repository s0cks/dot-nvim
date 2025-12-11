---@type LazyPluginSpec
return {
  'tadaa/vimade',
  event = 'VeryLazy',
  opts = {
    recipe = {
      'default',
      { animate = true },
    },
    nohlcheck = true,
  },
}
