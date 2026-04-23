---@return LazyPluginSpec
return {
  'selimacerbas/markdown-preview.nvim',
  cmd = {
    'MarkdownPreview',
    'MarkdownPreviewStop',
    'MarkdownPreviewRefresh',
  },
  dependencies = {
    'selimacerbas/live-server.nvim',
    'j-hui/fidget.nvim',
  },
  ft = { 'markdown', 'md' },
  opts = {
    -- all optional; sane defaults shown
    instance_mode = 'takeover', -- "takeover" (one tab) or "multi" (tab per instance)
    port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
    open_browser = true,
    debounce_ms = 300,
  },
  config = function(_, opts)
    require('markdown_preview').setup(opts)
  end,
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'markdown', 'md' },
      callback = function()
        local state = require('state.markdown-preview')
        local map = vim.keymap.set
        map('n', '<leader>mp', function()
          state:toggle()
        end, {
          desc = 'Toggle Markdown Preview',
        })
        map('n', '<leader>mpX', function()
          state:disable()
        end, {
          desc = 'Stop Markdown Preview',
        })
        map('n', '<leader>mpR', function()
          vim.cmd([[MarkdownPReviewRefresh]])
        end, {
          desc = 'Refresh Markdown Preview',
        })
      end,
    })
  end,
}
