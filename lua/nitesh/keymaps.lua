vim.g.mapleader = " "

-- General
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save" })
vim.keymap.set("n", "<C-q>", ":wq<CR>", { noremap = true, silent = true, desc = "Save and quit" })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, desc = "Escape insert mode" })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })

-- Window switching
vim.keymap.set("n", "<C-m>", function()
  local cur_win = vim.api.nvim_get_current_win()
  vim.cmd("wincmd h")
  if vim.api.nvim_get_current_win() == cur_win then
    vim.cmd("wincmd l")
  end
end, { noremap = true, silent = true, nowait = true, desc = "Switch window" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { silent = true, desc = "Close buffer" })

-- Undo / Redo (insert mode)
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { noremap = true, silent = true, desc = "Redo" })

-- Visual mode backspace deletes without yanking
vim.keymap.set("v", "<BS>", '"_d', { noremap = true, silent = true, desc = "Delete without yank" })

-- Plugins
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })

-- Telescope toggle
local function toggle_telescope(picker)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ok, ft = pcall(vim.api.nvim_get_option_value, "filetype", { buf = buf })
    if ok and ft == "TelescopePrompt" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  require("telescope.builtin")[picker]()
end

vim.keymap.set("n", "<leader>f", function() toggle_telescope("find_files") end, { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>g", function() toggle_telescope("live_grep") end, { noremap = true, silent = true, desc = "Live grep" })
vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true, desc = "Pick colorscheme" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover docs" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "References" })
vim.keymap.set("n", "<leader>j", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format buffer" })

-- Formatters / Linters
vim.keymap.set("n", "<leader>o", ":w<CR>:!black %<CR>", { noremap = true, silent = true, desc = "Format with black" })
vim.keymap.set("n", "<leader>s", ":!eslint --config ~/.config/nvim/lua/linter/eslint.config.js %<CR>", { noremap = true, silent = true, desc = "Run ESLint" })
vim.keymap.set("n", "<leader>m", ":!flake8 %<CR>", { noremap = true, silent = true, desc = "Run flake8" })

-- Duplicate line/selection
local function duplicate_down()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("y'>pgv", true, false, true), "n", true)
  elseif mode == "i" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>yypi", true, false, true), "n", true)
  else
    vim.api.nvim_feedkeys("yyp", "n", true)
  end
end

local function duplicate_up()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("y'<Pgv", true, false, true), "n", true)
  elseif mode == "i" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>yyPi", true, false, true), "n", true)
  else
    vim.api.nvim_feedkeys("yyP", "n", true)
  end
end

vim.keymap.set({ "n", "i", "v" }, "<C-S-Down>", duplicate_down, { silent = true, desc = "Duplicate down" })
vim.keymap.set({ "n", "i", "v" }, "<C-S-Up>", duplicate_up, { silent = true, desc = "Duplicate up" })

-- Move line up/down
vim.keymap.set({ "i", "v" }, "<C-Down>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>:m .+1<CR>==gi", true, false, true), "n", true)
end, { silent = true, desc = "Move line down" })

vim.keymap.set({ "i", "v" }, "<C-Up>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>:m .-2<CR>==gi", true, false, true), "n", true)
end, { silent = true, desc = "Move line up" })

-- Multi-cursor (vim-visual-multi)
vim.keymap.set("n", "<M-Down>", "<Cmd>VMAddCursorDown<CR>", { noremap = true, silent = true, desc = "Add cursor down" })
vim.keymap.set("n", "<M-Up>", "<Cmd>VMAddCursorUp<CR>", { noremap = true, silent = true, desc = "Add cursor up" })

vim.keymap.set("i", "<A-l>", "<Right>", { noremap = true, silent = true, desc = "Move right in insert mode" })
vim.keymap.set("i", "<A-h>", "<Left>", { noremap = true, silent = true, desc = "Move left in insert mode" })

-- Trouble
vim.keymap.set("n", "<leader>d", ":Trouble diagnostics toggle<CR>", { silent = true, desc = "Toggle trouble panel" })

-- Debugger
local dap = require("dap")
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F5>",  dap.continue,   { desc = "Debug continue" })
vim.keymap.set("n", "<F10>", dap.step_over,  { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into,  { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out,   { desc = "Step out" })
