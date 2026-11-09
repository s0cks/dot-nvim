local root_markers = {
  'mise.toml',
  '.mise.toml',
  'mise.local.toml',
  '.mise.local.toml',
  'mise/config.toml',
  '.mise/config.toml',
  '.config/mise/config.toml',
}

return {
  cmd = { 'mise', 'lsp' },
  filetypes = { 'toml' },
  root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers } or root_markers,
}
