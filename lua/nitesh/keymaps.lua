vim.g.mapleader = " "

-- ─── General ──────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<C-s>", ":w<CR>",  { noremap = true, silent = true, desc = "Save" })
vim.keymap.set("n", "<C-q>", ":wq<CR>", { noremap = true, silent = true, desc = "Save and quit" })
vim.keymap.set("i", "jj",    "<Esc>",   { noremap = true, desc = "Escape insert mode" })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })

-- ─── Delete WITHOUT yanking ───────────────────────────────────────────────────
-- By default dd/d cuts to clipboard. Use these to truly DELETE (not copy):
vim.keymap.set({ "n", "v" }, "<leader>dd", '"_dd', { noremap = true, silent = true, desc = "Delete line (no yank)" })
vim.keymap.set({ "n", "v" }, "<leader>D",  '"_D',  { noremap = true, silent = true, desc = "Delete to EOL (no yank)" })
vim.keymap.set({ "n", "v" }, "<leader>dw", '"_dw', { noremap = true, silent = true, desc = "Delete word (no yank)" })
-- In visual mode, delete selection without clobbering clipboard:
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete selection (no yank)" })
vim.keymap.set("v", "x", '"_x', { noremap = true, silent = true, desc = "Delete char (no yank)" })
vim.keymap.set("v", "<BS>", '"_d', { noremap = true, silent = true, desc = "Delete selection (no yank)" })

-- ─── Paste without clobbering clipboard ───────────────────────────────────────
-- When you paste over a selection, the old clipboard is preserved
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "Paste without yank" })

-- ─── Copy helpers ─────────────────────────────────────────────────────────────
-- NOTE: these are STANDARD vim motions, listing here as a reminder:
-- yl       = yank 1 character under cursor
-- yiw      = yank inner word (no surrounding spaces)
-- yaw      = yank a word (with surrounding space)
-- yy / Y   = yank whole line
-- y$       = yank from cursor to end of line
-- yi"      = yank inside quotes
-- yi(      = yank inside parentheses
-- Remap Y to behave like D (yank to end of line, not whole line):
vim.keymap.set("n", "Y", "y$", { noremap = true, desc = "Yank to end of line" })

-- ─── Window switching ─────────────────────────────────────────────────────────
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Window up" })

-- ─── Buffers ──────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<Tab>",   ":bnext<CR>",     { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>",      { silent = true, desc = "Close buffer" })

-- ─── Undo / Redo ──────────────────────────────────────────────────────────────
vim.keymap.set("i", "<C-z>", "<C-o>u",      { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>",  { noremap = true, silent = true, desc = "Redo" })

-- ─── Better indenting (stay in visual mode) ───────────────────────────────────
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right" })

-- ─── Move lines up/down (clean version) ───────────────────────────────────────
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==",        { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<C-Up>",   ":m .-2<CR>==",        { silent = true, desc = "Move line up" })
vim.keymap.set("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move line down" })
vim.keymap.set("i", "<C-Up>",   "<Esc>:m .-2<CR>==gi", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv",   { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<C-Up>",   ":m '<-2<CR>gv=gv",   { silent = true, desc = "Move selection up" })

-- ─── Duplicate line ───────────────────────────────────────────────────────────
vim.keymap.set("n", "<C-S-Down>", "yyp",            { silent = true, desc = "Duplicate down" })
vim.keymap.set("n", "<C-S-Up>",   "yyP",            { silent = true, desc = "Duplicate up" })
vim.keymap.set("i", "<C-S-Down>", "<Esc>yypi",      { silent = true, desc = "Duplicate down" })
vim.keymap.set("i", "<C-S-Up>",   "<Esc>yyPi",      { silent = true, desc = "Duplicate up" })
vim.keymap.set("v", "<C-S-Down>", "y'>p",  { silent = true, desc = "Duplicate selection down" })
vim.keymap.set("v", "<C-S-Up>",   "y'<P",  { silent = true, desc = "Duplicate selection up" })

-- ─── Insert mode navigation (arrow-like without leaving insert) ───────────────
vim.keymap.set("i", "<A-r>", "<Right>", { noremap = true, silent = true, desc = "Move right" })
vim.keymap.set("i", "<A-h>", "<Left>",  { noremap = true, silent = true, desc = "Move left" })
vim.keymap.set("i", "<A-j>", "<Down>",  { noremap = true, silent = true, desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Up>",    { noremap = true, silent = true, desc = "Move up" })
vim.keymap.set("i", "<A-e>", "<End>",   { noremap = true, silent = true, desc = "End of line" })
vim.keymap.set("i", "<A-a>", "<Home>",  { noremap = true, silent = true, desc = "Start of line" })

-- ─── Readline-style insert mode shortcuts ─────────────────────────────────────
-- Delete char forward (like terminal Ctrl-D)
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true, silent = true, desc = "Delete char at curosr location" })

-- Kill to end of line (like terminal Ctrl-K)\a\
vim.keymap.set("i", "<C-k>", "<C-o>D", { noremap = true, silent = true, desc = "Kill to end of line" })

-- Kill word forward (like terminal Alt-D)
vim.keymap.set("i", "<A-d>", "<C-o>de", { noremap = true, silent = true, desc = "Kill word forward" })

-- Kill word backward (like terminal Alt-Backspace)
vim.keymap.set("i", "<A-BS>", "<C-w>", { noremap = true, silent = true, desc = "Kill word backward" })

-- Uppercase to end of word (like terminal Alt-U)
vim.keymap.set("i", "<A-u>", "<C-o>gUe<Right>", { noremap = true, silent = true, desc = "Uppercase word" })

-- Lowercase to end of word (like terminal Alt-L)
vim.keymap.set("i", "<A-l>", "<C-o>gue<Right>", { noremap = true, silent = true, desc = "Lowercase word" })

-- ─── Plugins ──────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>e",  ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true, desc = "Pick colorscheme" })

-- Telescope (with toggle)
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
vim.keymap.set("n", "<leader>g", function() toggle_telescope("live_grep") end,  { noremap = true, silent = true, desc = "Live grep" })
vim.keymap.set("n", "<leader>r", function() toggle_telescope("oldfiles") end,   { noremap = true, silent = true, desc = "Recent files" })
vim.keymap.set("n", "<leader>b", function() toggle_telescope("buffers") end,    { noremap = true, silent = true, desc = "Open buffers" })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "gd",          vim.lsp.buf.definition,  { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set("n", "gD",          vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
vim.keymap.set("n", "gi",          vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
vim.keymap.set("n", "K",           vim.lsp.buf.hover,       { noremap = true, silent = true, desc = "Hover docs" })
vim.keymap.set("n", "<leader>rn",  vim.lsp.buf.rename,      { noremap = true, silent = true, desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
vim.keymap.set("n", "gr",          vim.lsp.buf.references,  { noremap = true, silent = true, desc = "References" })
vim.keymap.set("n", "<leader>j",   function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true, desc = "Format buffer" })
vim.keymap.set("n", "[d",          vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Prev diagnostic" })
vim.keymap.set("n", "]d",          vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Next diagnostic" })

-- ─── Formatters ───────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>o", ":w<CR>:!black %<CR>",  { noremap = true, silent = true, desc = "Format with black" })
vim.keymap.set("n", "<leader>m", ":!flake8 %<CR>",       { noremap = true, silent = true, desc = "Run flake8" })

-- ─── Multi-cursor ─────────────────────────────────────────────────────────────
vim.keymap.set("n", "<M-Down>", "<Cmd>VMAddCursorDown<CR>", { noremap = true, silent = true, desc = "Add cursor down" })
vim.keymap.set("n", "<M-Up>",   "<Cmd>VMAddCursorUp<CR>",   { noremap = true, silent = true, desc = "Add cursor up" })


-- ─── Flash ────────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "s", function() require("flash").jump() end, { desc = "Flash jump" })
vim.keymap.set({ "n", "v" }, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter select" })

-- ─── Harpoon ──────────────────────────────────────────────────────────────────
local harpoon = require("harpoon")
vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,{desc = "Harpoon select 1"})
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,{desc = "Harpoon select 2"})
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,{desc = "Harpoon select 3"})
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,{desc = "Harpoon select 4"})
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end,{desc = "Harpoon select 5"})

vim.keymap.set({ "n", "i" }, "<F5>", function()
  require("telescope.builtin").keymaps(require("telescope.themes").get_dropdown({
    prompt_title = "Keymaps",
    previewer = false,
    winblend = 10,
    border = true,
    layout_config = {
        width = 0.9,
        height = 0.6,
    },
  }))
end, { desc = "Search all keymaps" })
-- ─── Trouble & DAP (lazy-loaded in init.lua) ──────────────────────────────────
-- These are defined in init.lua since they bootstrap the plugin on first use
