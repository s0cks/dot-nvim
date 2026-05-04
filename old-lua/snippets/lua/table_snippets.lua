local util = require('util.snippets')
local ls = require('luasnip')
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

return {
  util.auto_postfix('.tblf', function(capture)
    return sn(nil, {
      t({ 'vim.tbl_filter(' }),
      i(1, 'func'),
      t({ ', ' .. capture .. ')' }),
    })
  end, {
    desc = 'Call vim.tbl_filter on table',
  }),
  util.auto_postfix('.tblnf', function(capture)
    return sn(nil, {
      t({ 'vim.tbl_filter(function()', '\t' }),
      ls.insert_node(1),
      t({ '\t', 'end, ' .. capture .. ')' }),
    })
  end, {
    desc = 'Call vim.tbl_filter on table',
  }),
  util.auto_postfix('.tblv', function(capture)
    return sn(nil, {
      t({ 'vim.tbl_values(' .. capture .. ')' }),
    })
  end, {
    desc = 'Call vim.tbl_filter on table',
  }),
  util.auto_postfix('.tblk', function(capture)
    return sn(nil, {
      t({ 'vim.tbl_keys(' .. capture .. ')' }),
    })
  end, {
    desc = 'Call vim.tbl_filter on table',
  }),
  util.auto_postfix('.tbldextf', function(capture)
    return sn(nil, {
      t({ "vim.tbl_deep_extend('force', " .. capture .. ',' }),
      i(1, 'rhs'),
      t({ ')' }),
    })
  end, {
    desc = "Call vim.tbl_deep_extend('force') on table",
  }),
}
