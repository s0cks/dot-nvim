---@return LazyPluginSpec
return {
  'declancm/cinnamon.nvim',
  version = '*',
  opts = {
    keymaps = {
      basic = true,
      extra = true,
    },
    options = {
      mode = 'cursor',
    },
  },
  init = function()
    local cinn = require('cinnamon')
    local map = vim.keymap.set

    local mapZZ = function(key, mode)
      return map(mode or 'n', key, function()
        return cinn.scroll(key .. 'zz')
      end)
    end

    local mapLSP = function(key, func, mode)
      return map(mode or 'n', key, function()
        return cinn.scroll(func)
      end)
    end

    --- centered scrolling motions
    mapZZ('<C-u>')
    mapZZ('<C-d>')
    --- LSP motions
    mapLSP('gd', vim.lsp.buf.definition)
    mapLSP('gD', vim.lsp.buf.declaration)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'help',
      callback = function()
        vim.b.cinnamon_disable = true
      end,
    })
  end,
}
