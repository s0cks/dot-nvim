return {
  type = 'executable',
  name = 'lldb',
  command = vim.fn.expand('LLVM_PATH') .. '/bin/lldb-dap',
}
