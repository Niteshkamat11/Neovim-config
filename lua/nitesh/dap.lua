-- Signs (shows red dot instead of B)
vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "▶",
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "",
})


local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("dap-python").setup("python3")

-- Auto open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end

-- C debugger
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap",
  name = "lldb",
}
dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
