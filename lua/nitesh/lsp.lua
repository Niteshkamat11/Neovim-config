-- ~/.config/nvim/lua/nitesh/lsp.lua
local capabilities = require("nitesh.cmp")

-- Define configs
vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
  capabilities = capabilities,
})

vim.lsp.config("html", {
  capabilities = capabilities,
})

vim.lsp.config("cssls", {
  capabilities = capabilities,
})

vim.lsp.config("jsonls", {
  capabilities = capabilities,
})

vim.lsp.config("emmet_ls", {
  capabilities = capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
})

-- Enable them (they will attach on matching filetypes)
vim.lsp.enable({ "pyright", "ts_ls", "clangd", "html", "cssls", "jsonls", "emmet_ls" })

