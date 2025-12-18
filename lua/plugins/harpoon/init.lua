---@class GotoHarpoonOpts
local default_goto_harpoon_opts = {}

---@param opts? GotoHarpoonOpts The options for the action
local function goto_harpoon(opts)
  opts = vim.tbl_deep_extend('force', default_goto_harpoon_opts, opts or {})
  return function(picker, item)
    if item then
      vim.schedule(function()
        vim.cmd.edit(vim.fn.fnameescape(item.file))
      end)
      picker:close()
    end
  end
end

---@class HarpoonPickerOpts : snacks.picker.Config
local default_harpoon_picker_opts = {}

---@param opts? HarpoonPickerOpts The options for the picker
local function harpoon_picker(opts)
  opts = vim.tbl_deep_extend('force', default_harpoon_picker_opts, opts or {})
  local finder = function()
    local harpoon = require('harpoon')
    local items = {}
    for _, item in ipairs(harpoon:list().items) do
      table.insert(items, {
        text = item.value,
        file = item.value,
      })
    end
    return items
  end

  Snacks.picker.pick({
    source = 'harpoons',
    finder = finder,
    title = 'Harpoons',
    format = 'text',
    layout = {
      preset = 'vertical',
    },
    win = {
      input = {
        keys = {
          ['dd'] = function(item)
            print('deleting ' .. vim.inspect(item))
          end,
        },
      },
      list = {
        keys = {
          ['dd'] = function(item)
            print('deleting ' .. vim.inspect(item))
          end,
        },
      },
    },
    confirm = goto_harpoon(),
  })
end

---
---
--- Harpoon - Bookmarks
---@url https://github.com/ThePrimeagen/harpoon
---@type LazyPluginSpec
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    mark_branch = true,
    tabline = true,
    tabline_prefix = '   ',
    tabline_suffix = '   ',
  },
  keys = {

    {
      '<leader>ha',
      function()
        local harpoon = require('harpoon')
        harpoon:list():add()
      end,
      'n',
      desc = 'Add a 🔱 Harpoon Mark',
    },
    {
      '<leader>ht',
      function()
        harpoon_picker()
      end,
      'n',
      desc = 'Test harpoon',
    },
    {
      '<leader>fh',
      function()
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      'n',
      desc = 'Find 🔱 Harpoon Marks',
    },
  },
}
