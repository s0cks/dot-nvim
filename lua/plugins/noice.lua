return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'kepano/flexoki-neovim',
  },
  opts = {
    cmdline = {
      format = {
        cmdline = {
          title = 'neovim',
        },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  },
  init = function()
    local c = require('flexoki.palette').palette()
    vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', {
      fg = c['tx'],
    })
    vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', {
      fg = c['tx'],
    })
  end,
}
