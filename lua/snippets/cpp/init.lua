local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
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
