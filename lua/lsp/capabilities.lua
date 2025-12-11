---@param defaults? table The default capabilities
return function(defaults)
  local capabilities = defaults or {}
  capabilities = vim.tbl_deep_extend('force', capabilities, vim.lsp.protocol.make_client_capabilities())

  local has_blink, blink = pcall(require, 'blink.cmp')
  if has_blink then
    capabilities = blink.get_lsp_capabilities(capabilities, false)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
  end

  return capabilities
end
