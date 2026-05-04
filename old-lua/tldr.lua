local M = {}

---@class TealdeerOpts
local default_opts = {}

function M.tldr(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value('buftype', 'nofile', {
    buf = buf,
  })
  vim.api.nvim_set_option_value('swapfile', false, {
    buf = buf,
  })
  vim.api.nvim_set_option_value('modifiable', false, {
    buf = buf,
  })

  vim.api.nvim_command('split')
  vim.api.nvim_win_set_buf(0, buf)

  vim.fn.jobstart('tldr ' .. cmd, {
    stdout_buffered = false,
    on_stdout = function(_, data)
      if data then
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(buf) then
            return
          end

          vim.api.nvim_set_option_value('modifiable', true, {
            buf = buf,
          })

          vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)

          vim.api.nvim_set_option_value('modifiable', false, {
            buf = buf,
          })

          vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
        end)
      end
    end,
    on_exit = function()
      print('finished')
    end,
  })
end

return M
