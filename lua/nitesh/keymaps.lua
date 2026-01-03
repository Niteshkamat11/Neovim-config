
--keymaps
vim.g.mapleader = " " -- assiging space to space 
vim.keymap.set("n","<C-s>",":w<CR>",{ noremap = true, silent = true}) -- save whatever you write

vim.keymap.set("n","<C-q>",":wq<CR>",{noremap = true, silent = true}) -- save and exit 

vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true }) -- close the current buffer
vim.keymap.set("i", "jj", "<Esc>", { noremap = true }) -- escape the insert mode
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true }) -- remove yellow highlighted color when you search something



vim.keymap.set("n", "<C-m>", function()
  local cur_win = vim.api.nvim_get_current_win()
  vim.cmd("wincmd h")  -- Try to go left
  if vim.api.nvim_get_current_win() == cur_win then
    vim.cmd("wincmd l")  -- If already on left, go right
  end
end, { noremap = true, silent = true , nowait =true})



--plugins

vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>",{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { noremap = true, silent = true })

--lsp

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })

--prettier format/linter
vim.keymap.set("n", "<leader>j", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format current buffer" }) -- works for js for formating fixing space ,indiction

--python formatter

vim.api.nvim_set_keymap(
  "n",
  "<leader>o",
  ":w<CR>:!black %<CR>",
  { noremap = true, silent = true }
)

-- Keymap to run ESLint on current file using your config
vim.api.nvim_set_keymap(
  "n",
  "<leader>s",
  ":!eslint --config ~/.config/nvim/lua/linter/eslint.config.js %<CR>",
  { noremap = true, silent = true }
)

-- keymap for python/linter

vim.api.nvim_set_keymap(
  "n",
  "<leader>m",
  ":!flake8 %<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- Duplicate line or selection down
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

-- Duplicate line or selection up
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

vim.keymap.set({ "n", "i", "v" }, "<C-S-Down>", duplicate_down, { desc = "Duplicate line/selection down", silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-S-Up>", duplicate_up, { desc = "Duplicate line/selection up", silent = true })


-- Move line down from insert mode
vim.keymap.set({"i", "v"}, "<C-Down>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>:m .+1<CR>==gi", true, false, true), "n", true)
end, { desc = "Move line down", silent = true })

-- Move line up from insert mode
vim.keymap.set({"i", "v"}, "<C-Up>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>:m .-2<CR>==gi", true, false, true), "n", true)
end, { desc = "Move line up", silent = true })


-- Add cursor down + select word
vim.api.nvim_set_keymap(
  "n",
  "<M-Down>",
  "<Cmd>VMAddCursorDown<CR><Cmd>VMSelectCursorWord<CR>",
  { noremap = true, silent = true }
)

-- Add cursor up + select word
vim.api.nvim_set_keymap(
  "n",
  "<M-Up>",
  "<Cmd>VMAddCursorUp<CR><Cmd>VMSelectCursorWord<CR>",
  { noremap = true, silent = true }
)


-- Make backspace delete selected text in visual mode
vim.api.nvim_set_keymap('v', '<BS>', '"_d', { noremap = true, silent = true })
  
-- Undo / Redo like VSCode

vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })         -- Undo
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { noremap = true, silent = true })    -- Redo alternative

-- Next/Previous buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- Close buffer
vim.keymap.set("n", "<leader>x", ":bd<CR>", { silent = true })

-- Colorscheme picker
vim.keymap.set('n', '<leader>cs', ':Telescope colorscheme<CR>', { desc = 'Select colorscheme' })
