local enabled = false

---@return LazyPluginSpec
return {
  'iamcco/markdown-preview.nvim',
  cmd = {
    'MarkdownPreviewToggle',
    'MarkdownPreview',
    'MarkdownPreviewStop',
  },
  dependencies = {
    'j-hui/fidget.nvim',
  },
  build = 'cd app && npm install',
  ft = { 'markdown' },
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'markdown', 'md' },
      callback = function()
        local fidget = require('fidget')
        Snacks.toggle
          .new(
            ---@type snacks.toggle.Opts
            {
              id = 'markdown-preview',
              name = 'Markdown Preview',
              get = function()
                return enabled
              end,
              set = function(value)
                enabled = value
                if enabled then
                  fidget.notify('markdown-preview enabled', vim.log.levels.INFO)
                  vim.cmd([[MarkdownPreview]])
                else
                  fidget.notify('markdown-preview disabled', vim.log.levels.INFO)
                  vim.cmd([[MarkdownPreviewStop]])
                end
              end,
            }
          )
          :map('<leader>mp')
      end,
    })
  end,
}
