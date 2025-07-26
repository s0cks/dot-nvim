local events = require('neo-tree.events')

local function on_move(data)
  Snacks.rename.on_rename_file(data.source, data.destination)
end

return {
  close_if_last_window = false,
  enable_git_status = true,
  enable_diagnostics = true,
  event_handlers = {
    {
      event = events.FILE_MOVED,
      handler = on_move,
    },
    {
      event = events.FILE_RENAMED,
      handler = on_move,
    },
  },
  open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = '󰝰',
      folder_open = '󰉋',
      folder_empty = '󰉖',
      default = '*',
      highlight = 'NeoTreeFileIcon',
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    git_status = {
      symbols = {
        -- Change type
        added = '󰝒',
        modified = '󰷈', -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = '󱪟', -- this can only be used in the git_status source
        renamed = '󰬲', -- this can only be used in the git_status source
        -- Status type              untracked = "",
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
    file_size = {
      enabled = false,
    },
    type = {
      enabled = false,
    },
    last_modified = {
      enabled = false,
    },
    created = {
      enabled = false,
    },
    symlink_target = {
      enabled = false,
    },
  },
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ['<bs>'] = nil,
      },
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = 'disabled',
    filtered_items = {
      visible = false,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        '.git',
        '.DS_Store',
      },
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    show_unloaded = true,
  },
  view = { adaptive_size = true },
}
