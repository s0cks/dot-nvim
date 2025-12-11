---@url https://github.com/sam-sly/quickfiles.nvim
---@type LazyPluginSpec
return {
  'sam-sly/quickfiles.nvim',
  opts = {
    prompt = {
      -- Whether to display the directory name in the prompt.
      show_directory = true,

      -- The number of directory levels to show in the prompt.
      depth = 1,
    },
    deletion = {
      -- Whether to prompt for confirmation before deleting files.
      confirm = true,

      -- If true, recursively deletes empty directories after file deletion.
      -- This applies only to the `:QuickFilesDeleteFileAndEmptyDirs` command/keymap.
      delete_nested_empty_dirs = true,
    },
    keymaps = {
      -- Keymap to create a new file in the current buffer's directory.
      new_file_at_buffer_dir = '<leader>fn',

      -- Keymap to create a new file in the current working directory.
      new_file_at_cwd = '<leader>fN',

      -- Keymap to delete the current file.
      delete_file = '<leader>fd',

      -- Keymap to delete the current file and recursively delete empty directories.
      delete_file_and_empty_dirs = '<leader>fD',
    },
  },
}
