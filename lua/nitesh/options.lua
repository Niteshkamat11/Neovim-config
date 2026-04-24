--display section
vim.opt.number = true
vim.opt.relativenumber = true  ---- Show relative numbers
vim.opt.signcolumn  = "yes"
vim.opt.scrolloff   = 8  
vim.opt.wrap        = false 
vim.opt.cursorline  = true 
vim.opt.sidescrolloff = 8

--Indentation secton
vim.opt.tabstop     = 4                -- A tab = 4 spaces
vim.opt.shiftwidth  = 4             -- Indent = 4 spaces
vim.opt.expandtab   = true           -- Use spaces instead of tabs
vim.opt.smartindent = true

vim.opt.updatetime  = 100
vim.opt.timeoutlen  = 300
vim.opt.ttimeoutlen = 10
vim.opt.lazyredraw  = false
vim.opt.ttyfast     = true

--  Search
vim.opt.ignorecase = true           -- case-insensitive search...
vim.opt.smartcase  = true           -- ...unless you type uppercase
vim.opt.hlsearch   = true
vim.opt.incsearch  = true           -- show match as you type

-- Splits 
vim.opt.splitbelow = true           -- horizontal splits go below
vim.opt.splitright = true           -- vertical splits go right

--Files & History
vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undofile = true             -- persistent undo across sessions

-- Misc
vim.opt.mouse      = "a"
vim.opt.clipboard  = "unnamedplus"
vim.opt.pumheight  = 10            -- max completion menu items
vim.opt.showmode   = false          -- lualine already shows the mode
vim.opt.termguicolors = true


vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("~/.local/bin")
