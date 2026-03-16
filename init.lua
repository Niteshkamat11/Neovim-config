vim.o.termguicolors = true
-- add these at the bottom of init.lua
require("nitesh.dap")
require("trouble").setup()
require("nitesh.plugins")
require("nvim-autopairs").setup({ check_ts = true }) -- add here
require("nitesh.colors")
require("nitesh.options")
require("nitesh.colorscheme")
require("nitesh.keymaps")
require("nitesh.cmp")
require("nitesh.lsp")
require("nitesh.devicons")
require("nitesh.lualine")
require("nitesh.nvimtree")
require("nitesh.telescope")
--require("nitesh.treesitter")
require("nitesh.indent")
require("nitesh.which-key")
require("nitesh.alpha")
require("nitesh.null-ls")
require("nitesh.gitsigns")
require("nitesh.terminal")
require("nitesh.bufferline")


