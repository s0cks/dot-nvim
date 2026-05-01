---@param defaults? table The default capabilities
return function(defaults)
  local caps = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), defaults or {})

  local has_blink, blink = pcall(require, 'blink.cmp')
  if has_blink then
    caps = blink.get_lsp_capabilities(caps, false)
    caps.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
  end

  return caps
end
