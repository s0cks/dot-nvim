local util = require('util.snippets')
local ls = require('luasnip')
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
return {
  util.auto_postfix('.buf_valid', function(capture)
    return sn(nil, {
      t({ 'vim.api.nvim_buf_is_valid(' .. capture .. ')' }),
    })
  end, {
    desc = 'Call vim.api.nvim_buf_is_valid on buf object.',
  }),
}
