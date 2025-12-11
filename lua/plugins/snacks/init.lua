-- local progress = function(ev)
--   local client = vim.lsp.get_client_by_id(ev.data.client_id)
--   local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
--   if not client or type(value) ~= 'table' then
--     return
--   end
--
--   local prog = vim.defaulttable()
--   local p = prog[client.id]
--
--   for i = 1, #p + 1 do
--     if i == #p + 1 or p[i].token == ev.data.params.token then
--       p[i] = {
--         token = ev.data.params.token,
--         msg = ('[%3d%%] %s%s'):format(
--           value.kind == 'end' and 100 or value.percentage or 100,
--           value.title or '',
--           value.message and (' **%s**'):format(value.message) or ''
--         ),
--         done = value.kind == 'end',
--       }
--       break
--     end
--   end
--
--   local msg = {} ---@type string[]
--   prog[client.id] = vim.tbl_filter(function(v)
--     return table.insert(msg, v.msg) or not v.done
--   end, p)
--
--   local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
--   vim.notify(table.concat(msg, '\n'), 'info', {
--     id = 'lsp_progress',
--     title = client.name,
--     opts = function(notif)
--       notif.icon = #prog[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
--     end,
--   })
-- end
--

return {
  ---@url https://github.com/folke/snacks.nvim
  ---@type LazyPluginSpec
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      indent = { enabled = true },
      notifier = { enabled = true },
      scope = {},
      image = {},
      statuscolumn = {},
      toggle = {
        enabled = true,
        which_key = true,
      },
      scratch = {},
      scroll = { enabled = true },
      zen = require('plugins.snacks.config.zen'),
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
        end,
      })
    end,
    keys = {
      {
        '<leader>zm',
        function()
          Snacks.zen()
        end,
        { desc = 'Toggle Zen Mode' },
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        'n',
        desc = 'Toggle scratch buffer',
      },
      {
        '<leader>S',
        function()
          Snacks.scratch.select()
        end,
        'n',
        desc = 'Select scratch buffer',
      },
      {
        '<leader>to',
        function() end,
        'n',
        desc = 'Open toggles',
      },
    },
  },
}
