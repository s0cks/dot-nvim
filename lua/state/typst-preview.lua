local PreviewState = require('state.preview-state')
local M = PreviewState:new('typst-preview', {
  on_enable = 'TypstPreview',
  on_disable = 'TypstPreviewStop',
})
return M
