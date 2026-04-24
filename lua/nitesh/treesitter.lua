require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "typescript", "c", "lua" },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gn",
      node_incremental = "ga",
      scope_incremental = "gb",
      node_decremental = "gm",
    },
  },

}
