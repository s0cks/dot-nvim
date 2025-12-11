---@url https://github.com/jsongerber/thanks.nvim
---@type LazyPluginSpec
return {
  'jsongerber/thanks.nvim',
  opts = {
    star_on_install = true,
    star_on_startup = false,
    ignore_repos = {},
    ignore_authors = {},
    unstar_on_uninstall = false,
    ask_before_unstarring = false,
    ignore_unauthenticated = false,
  },
}
