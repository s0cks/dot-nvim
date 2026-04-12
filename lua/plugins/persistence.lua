return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = function()
      local persistence = require('persistence')
      local function map(key, func, opts)
        opts = vim.tbl_deep_extend('force', {
          mode = 'n',
        }, opts or {})

        if type(func) ~= 'function' then
          if type(func) ~= 'string' then
            func = tostring(func)
          end

          if persistence[func] and type(persistence[func]) == 'function' then
            func = persistence[func]
          end
        end

        return {
          key,
          func,
          opts.mode,
          desc = opts.desc or nil,
        }
      end

      return {
        map('<leader>qs', 'load', {
          desc = 'Load the session for the current directory',
        }),
        map('<leader>qS', 'select', {
          desc = 'Select a session to load',
        }),
        map('<leader>ql', function()
          return persistence.load({ last = true })
        end, {
          desc = 'Load the last session',
        }),
        map('<leader>qd', 'stop', {
          desc = "Don't save session on exit",
        }),
      }
    end,
  },
}
