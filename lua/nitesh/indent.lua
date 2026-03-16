local hooks = require("ibl.hooks")

-- Register highlights FIRST before setup
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "IndentBlanklineChar",     { fg = "#d5c4a1" } )
  vim.api.nvim_set_hl(0, "IndentBlanklineScopeChar",{ fg = "#ebdbb2" })
end)

-- Then setup
require("ibl").setup({
  indent = {
    char = "│",
    highlight = "IndentBlanklineChar",
  },
  scope = {
    enabled = true,
    highlight = "IndentBlanklineScopeChar",
  },
})
