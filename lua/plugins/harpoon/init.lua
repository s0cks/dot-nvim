return {
  ---@type LazyPluginSpec
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    init = function()
      local harpoon = require('harpoon')
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        local harpoon_extensions = require('harpoon.extensions')
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end
      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Add a Hapoon 🔱 mark' })

      vim.keymap.set('n', '<leader>fh', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open Harpoon 🔱' })
    end,
  },
}
