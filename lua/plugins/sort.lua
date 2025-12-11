return {
  'sQVe/sort.nvim',
  opts = {
    -- Delimiter priority order.
    delimiters = {
      ',',
      '|',
      ';',
      ':',
      's', -- Space.
      't', -- Tab.
    },

    -- Natural sorting (default: true).
    natural_sort = true,

    -- Case-insensitive sorting (default: false).
    ignore_case = false,

    -- Whitespace alignment threshold.
    whitespace = {
      alignment_threshold = 3,
    },

    -- Default keymappings (set to false to disable).
    mappings = {
      operator = 'go',
      textobject = {
        inner = 'io',
        around = 'ao',
      },
      motion = {
        next_delimiter = ']o',
        prev_delimiter = '[o',
      },
    },
  },
}
