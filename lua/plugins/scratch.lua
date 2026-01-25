local function compile_current_scratch()
  local parent_dir = vim.fn.expand('%:p:h')
  local filename = vim.fn.expand('%:t')
  local wez = require('wezterm-cli')
  vim.notify('compiling ' .. filename .. ' in ' .. parent_dir)
  wez.spawn({
    '/usr/bin/zsh',
    '-c',
    'clang++ ' .. filename .. ' -o scratch; read -sk',
  }, {
    cwd = parent_dir,
  })
end

return {
  's0cks/scratch.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    file_picker = 'telescope',
    use_telescope = true,
    window_cmd = 'edit',
    filetypes = {
      'bash',
      'cc',
      'css',
      'h',
      'js',
      'json',
      'jsonnet',
      'lua',
      'markdown',
      'md',
      'python',
      'sh',
      'toml',
      'ts',
      'xml',
      'yaml',
      'zsh',
    },
    keys_per_ft = {
      cpp = function()
        local map = vim.keymap.set
        map('n', '<leader>CC', compile_current_scratch, {
          desc = 'Test',
          noremap = true,
        })
      end,
    },
  },
  keys = function()
    local prefix = '<leader>s'
    local map = function(key, func, opts)
      opts = vim.tbl_deep_extend('force', {
        modes = { 'n' },
      }, opts or {})

      return {
        prefix .. key,
        func,
        opts.modes,
        desc = opts.desc,
      }
    end

    return {
      map('n', ':Scratch<cr>', {
        desc = 'Create a new scratch file',
      }),
      map('N', ':ScratchWithName<cr>', {
        desc = 'Create a new scratch file w/ a name',
      }),
      map('f', ':ScratchFzf<cr>', {
        desc = 'Open a fuzzy find in the scratch directory',
      }),
      map('o', ':ScratchOpen<cr>', {
        desc = 'Open a scratch file',
      }),
    }
  end,
  init = function(opts)
    opts = vim.tbl_deep_extend('force', {
      --- do something?
    }, opts)
    for ft, keys in pairs(opts.keys_per_ft or {}) do
      if type(keys) == 'function' then
        vim.api.nvim_create_autocmd('FileType', {
          pattern = ft .. '.scratch',
          callback = keys,
        })
      else
        vim.notify('not implemented', vim.log.levels.WARN)
      end
    end
  end,
}
