--- Tip - Neovim launch tip greeter
---@url https://github.com/TobinPalmer/Tip.nvim
---@type LazyPluginSpec
return {
  'TobinPalmer/Tip.nvim',
  event = 'VimEnter',
  opts = {
    seconds = 5,
    title = '💡 Tip!',
    url = 'https://vtip.43z.one', -- 'https://vimiscool.tech/neotip',
  },
}
