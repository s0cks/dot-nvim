return {
  animation = {
    enabled = true,
  },
  highlights = {
    undo = {
      hl = 'UgUndo', -- This will not set new hlgroup, if it's not "UgUndo", we will try to grab the colors of specified hlgroup and apply to "UgUndo"
      hl_color = { bg = '#FF5555' }, -- Ugly red color
    },
    redo = {
      hl = 'UgRedo', -- Same as above
      hl_color = { bg = '#50FA7B' }, -- Ugly green color
    },
    yank = {
      hl = 'UgYank', -- Same as above
      hl_color = { bg = '#F1FA8C' }, -- Ugly yellow color
    },
    paste = {
      hl = 'UgPaste', -- Same as above
      hl_color = { bg = '#8BE9FD' }, -- Ugly cyan color
    },
    search = {
      hl = 'UgSearch', -- Same as above
      hl_color = { bg = '#BD93F9' }, -- Ugly purple color
    },
    comment = {
      hl = 'UgComment', -- Same as above
      hl_color = { bg = '#FFB86C' }, -- Ugly purple color
    },
    cursor = {
      hl = 'UgCursor', -- Same as above
      hl_color = { bg = '#FF79C6' }, -- Ugly magenta color
    },
  },
}
