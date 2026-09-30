vim.lsp.enable("pyright")
vim.treesitter.start()

local localRoot = vim.fn.getcwd()
local dap = require("dap")
dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Attach remote debugpy",
    connect = {
      host = "127.0.0.1",
      port = 5678,
    },
    pathMappings = {
      {
        localRoot = localRoot,
        remoteRoot = "/home/user/Codes/" .. vim.fn.fnamemodify(localRoot, ":t"),
      },
    },
  },
}
