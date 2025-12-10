require("nvim-tree").setup({
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    ignore = false,  -- important
  },
})

