local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "IndentBlanklineChar",      { fg = "#3d3d3d" })
  vim.api.nvim_set_hl(0, "IndentBlanklineScopeChar", { fg = "#6b6b6b" })
end)

require("ibl").setup({
  indent = {
    char = "│",
    highlight = "IndentBlanklineChar",
  },
  scope = {
    -- Scope tracking fires on every CursorMoved — disable if you feel lag
    -- Set to true if you want it back and your machine handles it fine
    enabled = false,
  },
})
