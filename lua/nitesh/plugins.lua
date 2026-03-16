vim.g.VM_maps = {
    ["Add Cursor Down"] = "<M-Down>",
    ["Add Cursor Up"] = "<M-Up>",
    ["Find Under"] = "<C-d>",        -- change this line
    ["Find Subword Under"] = "<C-d>", -- and this line
}
vim.g.VM_set_statusline = 0
vim.g.VM_show_warnings = 0
vim.g.VM_default_mappings = 0

require "paq" {
    "savq/paq-nvim";
    -- Colorschemes
    "folke/tokyonight.nvim";
    "morhetz/gruvbox";
    "rebelot/kanagawa.nvim";
    -- indent guides
    "lukas-reineke/indent-blankline.nvim";
    -- error/warning panel
    "folke/trouble.nvim";
    -- debugger
    "mfussenegger/nvim-dap";
    "rcarriga/nvim-dap-ui";
    "nvim-neotest/nvim-nio";         -- required by dap-ui
    "mfussenegger/nvim-dap-python";
    "catppuccin/nvim";
    -- Core utilities
    "nvim-lua/plenary.nvim";
    -- Editing
    "kylechui/nvim-surround";
    "tpope/vim-commentary";
    "tpope/vim-repeat";
    "justinmk/vim-sneak";
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup{} end };
    { "mg979/vim-visual-multi", branch = "master" };
    -- File explorer & finder
    "nvim-tree/nvim-tree.lua";
    "nvim-telescope/telescope.nvim";
    -- Icons
    "nvim-tree/nvim-web-devicons";
    -- LSP
    "neovim/nvim-lspconfig";
    "nvimtools/none-ls.nvim";
    -- Completion
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-path";
    "hrsh7th/cmp-cmdline";
    "L3MON4D3/LuaSnip";
    "saadparwaiz1/cmp_luasnip";
    "rafamadriz/friendly-snippets";
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", run = function() vim.cmd("TSUpdate") end };
    -- UI
    "nvim-lualine/lualine.nvim";
    "akinsho/bufferline.nvim";
    "akinsho/nvim-toggleterm.lua";
    "goolord/alpha-nvim";
    "norcalli/nvim-colorizer.lua";
    -- Git
    { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end };
    -- Helpers
    "folke/which-key.nvim";
}

-- Single setup calls here (not duplicated)
require("nvim-surround").setup()
