---@type LazyPluginSpec
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scope = {},
    image = {},
    picker = {},
    statuscolumn = {},
    toggle = {
      enabled = true,
      which_key = true,
    },
    gh = {},
    git = {},
    input = {},
    words = {},
    win = {},
    gitbrowse = {},
    scratch = {},
    zen = {},
    lazygit = require('plugins.snacks.lazygit'),
    terminal = require('plugins.snacks.terminal'),
    dashboard = require('plugins.snacks.dashboard'),
  },
  keys = {
    {
      '<leader>Z',
      function()
        Snacks.zen()
      end,
      'n',
      desc = 'Enter zen mode',
    },
    {
      '<leader>S',
      group = 'Scratch',
    },
    {
      '<leader>So',
      function()
        Snacks.scratch()
      end,
      'n',
      desc = 'Toggle scratch buffer',
    },
    {
      '<leader>Ss',
      function()
        Snacks.scratch.select()
      end,
      'n',
      desc = 'Search scratch buffers',
    },
    {
      ';',
      function()
        Snacks.lazygit.open()
      end,
      'n',
      desc = 'Open lazygit',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      'n',
      desc = 'Find files',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      'n',
      desc = 'Find buffers',
    },
    {
      '<leader>fgr',
      function()
        Snacks.picker.grep()
      end,
      'n',
      desc = 'Find using grep',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.commands()
      end,
      'n',
      desc = 'Find commands',
    },
    {
      '<leader>fac',
      function()
        Snacks.picker.autocmds()
      end,
      'n',
      desc = 'Find autocmds',
    },
    {
      '<leader>fkm',
      function()
        Snacks.picker.keymaps()
      end,
      'n',
      desc = 'Find keymap',
    },
    {
      '<leader>fm',
      function()
        Snacks.picker.marks()
      end,
      'n',
      desc = 'Find marks',
    },
    {
      '<leader>flp',
      function()
        Snacks.picker.lazy()
      end,
      'n',
      desc = 'Find LazyPluginSpec',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.lsp_symbols()
      end,
      'n',
      desc = 'Find LSP Symbols',
    },
    {
      '<leader>fS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      'n',
      desc = 'Find LSP Workspace Symbols',
    },
    {
      '<leader>g',
      function()
        Snacks.picker.lsp_symbols()
      end,
      'n',
      desc = 'Find LSP Symbols',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      'n',
      desc = 'Find LSP Definitions',
    },
    {
      '<leader>fD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      'n',
      desc = 'Find LSP Declarations',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.lsp_references()
      end,
      'n',
      desc = 'Find LSP References',
    },
    {
      '<leader>ft',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      'n',
      desc = 'Find LSP Type Definitions',
    },
    {
      '<leader>Gfb',
      function()
        Snacks.picker.git_branches()
      end,
      'n',
      desc = 'Find git branch',
    },
    {
      '<leader>Gfl',
      function()
        Snacks.picker.git_log()
      end,
      'n',
      desc = 'Find git log',
    },
    {
      '<leader>Gfs',
      function()
        Snacks.picker.git_stash()
      end,
      'n',
      desc = 'Find git stash',
    },
    {
      '<leader>Ghfi',
      function()
        Snacks.picker.gh_issue()
      end,
      'n',
      desc = 'Find GitHub issues (Open)',
    },
    {
      '<leader>GhfI',
      function()
        Snacks.picker.gh_issue({ state = 'all' })
      end,
      'n',
      desc = 'Find GitHub issues (All)',
    },
    {
      '<leader>Ghfp',
      function()
        Snacks.picker.gh_pr()
      end,
      'n',
      desc = 'Find GitHub pull request (Open)',
    },
    {
      '<leader>GhfP',
      function()
        Snacks.picker.gh_pr({ state = 'all' })
      end,
      'n',
      desc = 'Find GitHub pull request (All)',
    },
  },
  init = function()
    vim.is_testing = false
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
      end,
    })
  end,
}
