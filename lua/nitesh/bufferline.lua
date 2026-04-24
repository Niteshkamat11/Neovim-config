require("bufferline").setup {
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    always_show_bufferline = true,
    separator_style = "slant",

    -- Removed bufdelete reference since it's not in your plugins
    close_command = "bd %d",
  },
}

