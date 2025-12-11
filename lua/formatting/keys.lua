local util = require('formatting.util')
return {
  {
    '<leader>fo',
    util.format_current_buffer,
    mode = 'n',
    desc = '[F]ormat buffer',
  },
}
