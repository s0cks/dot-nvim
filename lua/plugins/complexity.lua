return {
  '4DRIAN0RTIZ/complexity.nvim',
  event = 'VeryLazy',
  opts = {
    thresholds = {
      low = 10, -- CCN <= low is considered low complexity
      medium = 15, -- CCN > low and <= medium is medium complexity
      -- CCN > medium is high complexity
    },

    virt_prefix = '⮕ Complexity:', -- text prefix for virtual text
    virt_pos = 'eol', -- extmark position ("eol" or "overlay")
  },
}
