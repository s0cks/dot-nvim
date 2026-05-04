local util = require('util.snippets')
local ls = require('luasnip')
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
return {
  util.auto_postfix('.win_valid', function(capture)
    return sn(nil, {
      t({ 'vim.api.nvim_win_is_valid(' .. capture .. ')' }),
    })
  end, {
    desc = 'Call vim.api.nvim_win_is_valid on win object.',
  }),
}
