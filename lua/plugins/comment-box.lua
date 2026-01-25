---@url https://github.com/LudoPinelli/comment-box.nvim
---@type LazyPluginSpec
return {
  'LudoPinelli/comment-box.nvim',
  event = 'VeryLazy',
  version = '*',
  opts = {},
  keys = function()
    local prefix = '<leader>Cb'
    local map = function(key, func, opts)
      opts = vim.tbl_deep_extend('force', {
        modes = { 'n', 'v' },
      }, opts)
      if type(func) ~= 'function' then
        --- TODO(@s0cks): check comment box for function
      end

      return {
        prefix .. key,
        func,
        opts.modes,
        desc = opts.desc,
      }
    end

    return {
      {
        prefix,
        group = 'Comment Box',
      },
      map('al', ':CBalbox<cr>', {
        desc = 'Create a left aligned line box',
      }),
      map('tl', ':CBllline<cr>', {
        desc = 'Insert titled line box',
      }),
      map('l', ':CBline<cr>', {
        desc = 'Insert simple line box',
      }),
      map('m', ':CBllbox14<cr>', {
        desc = 'Insert marked box',
      }),
      map('d', ':CBd<cr>', {
        desc = 'Delete box',
      }),
    }
  end,
}
