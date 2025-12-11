local conditions = require('heirline.conditions')
local colors = require('theme.colors')
local Diagnostic = vim.diagnostic
local Severity = Diagnostic.severity

local DiagnosticSeverityComponent = function(severity, symbol, color)
  return {
    provider = function(self)
      return symbol .. self.values[severity]
    end,
    condition = function(self)
      return self.values[severity] > 0
    end,
    hl = { fg = color },
  }
end

---@param bufnr number The target buffer number
---@param severity number The severity to count
local function get_count_for_severity(bufnr, severity)
  return #Diagnostic.get(bufnr, { severity = severity })
end

local basic_components = require('plugins.heirline.components.basic')
return {
  init = function(self)
    self.values = {}
    local bufnr = vim.api.nvim_get_current_buf()
    self.values[1] = get_count_for_severity(bufnr, Severity.ERROR)
    self.values[2] = get_count_for_severity(bufnr, Severity.WARN)
    self.values[3] = get_count_for_severity(bufnr, Severity.HINT)
    self.values[4] = get_count_for_severity(bufnr, Severity.INFO)
  end,
  condition = conditions.has_diagnostics,
  update = { 'BufEnter', 'DiagnosticChanged' },
  --- errors
  DiagnosticSeverityComponent(1, 'E', colors['re']),
  basic_components.Space,
  --- warnings
  DiagnosticSeverityComponent(2, 'W', colors['ye']),
  basic_components.Space,
  --- hints
  DiagnosticSeverityComponent(3, 'H', colors['cy']),
  basic_components.Space,
  --- info
  DiagnosticSeverityComponent(4, 'I', colors['tx']),
}
