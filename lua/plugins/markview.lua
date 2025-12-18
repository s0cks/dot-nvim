local enabled = false

---@type snacks.toggle.Opts
local markview_toggle_opts = {
  id = 'markview',
  name = 'Markview',
  get = function()
    return enabled
  end,
  set = function(value)
    enabled = value
    ---TODO(@s0cks): this is a really hacky way to toggle Markview
    if value then
      vim.cmd([[Markview enable]])
    else
      vim.cmd([[Markview disable]])
    end
  end,
}

---@type LazyPluginSpec
return {
  'OXY2DEV/markview.nvim',
  --[[
  Do not lazy load this plugin as it is already lazy-loaded.
  Lazy-loading may cause more time for the previews to load when starting Neovim!
  --]]
  lazy = false,
  priority = 49,
  dependencies = {
    'saghen/blink.cmp',
    'kepano/flexoki-neovim',
  },
  opts = {
    enabled = false,
  },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'md', 'markdown' },
      callback = function()
        Snacks.toggle.new(markview_toggle_opts):map('<leader>mv', {
          buffer = true,
        })
      end,
    })
  end,
}
