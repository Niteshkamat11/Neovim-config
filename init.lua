-- ─── Core (must load first) ───────────────────────────────────────────────────
require("nitesh.options")
require("nitesh.plugins")
require("nitesh.colorscheme")
require("nitesh.keymaps")

-- ─── UI ───────────────────────────────────────────────────────────────────────
require("nitesh.lualine")
require("nitesh.bufferline")
require("nitesh.alpha")
require("nitesh.devicons")
require("nitesh.indent")
require("nitesh.colors")
require("nitesh.which-key")

-- ─── Editor behaviour ─────────────────────────────────────────────────────────
require("nvim-autopairs").setup({ check_ts = false }) -- check_ts=true caused lag
require("nvim-surround").setup()

-- ─── File tree / finder ───────────────────────────────────────────────────────
require("nitesh.nvimtree")
require("nitesh.telescope")

-- ─── LSP & completion ─────────────────────────────────────────────────────────
require("nitesh.cmp")
require("nitesh.lsp")
require("nitesh.null-ls")
require("nitesh.fidget")

-- ─── Git ──────────────────────────────────────────────────────────────────────
require("nitesh.gitsigns")

-- ─── Terminal ─────────────────────────────────────────────────────────────────
require("nitesh.terminal")

require("flash").setup()
require("nitesh.harpoon")

-- ─── Lazy-load heavy plugins only when needed ─────────────────────────────────
-- Trouble: only load when the keymap is first used
vim.keymap.set("n", "<leader>d", function()
  require("trouble").setup()
  vim.cmd("Trouble diagnostics toggle")
end, { silent = true, desc = "Toggle trouble panel" })


-- DAP: only load when you actually try to debug
vim.keymap.set("n", "<leader>b", function()
  require("nitesh.dap")
  -- re-register real DAP keymaps now that it's loaded
  local dap = require("dap")
  vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
  dap.toggle_breakpoint()
end, { desc = "Toggle breakpoint (load DAP)" })

-- Treesitter (commented out in your original — enable carefully, it can be heavy)
 require("nitesh.treesitter")
