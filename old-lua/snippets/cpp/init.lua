local utils = require('utils')
local cstyle = require('util.snippets.comments').cstyle

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
  cstyle.line_comment(),
  cstyle.todo_comment(),
  cstyle.block_comment(),
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
}

utils.append(snippets, require('util.snippets.iwyu'))
return snippets
