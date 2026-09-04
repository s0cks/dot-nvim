local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local utils = require('utils')

local snippets = {}
utils.append(snippets, require('util.snippets.comments.cstyle'))
utils.append(snippets, require('util.snippets.iwyu'))
utils.append(snippets, {
  {
    s('main-func', {
      t({
        '#include <print>',
        '#include <cstdlib>',
        '',
        'auto main(int argc, char** argv) -> int {',
        'std::println("{} is not implemented", __PRETTY_FUNCTION__);',
        '',
      }),
      i(0, 'return EXIT_SUCCESS;'),
      t({
        '',
        '}',
      }),
    }),
  },
})

return snippets
