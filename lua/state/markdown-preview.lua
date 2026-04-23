local PreviewState = require('state.preview-state')
local M = PreviewState:new('markdown-preview', {
  on_enable = 'MarkdownPreview',
  on_disable = 'MarkdownPreviewStop',
})
return M
