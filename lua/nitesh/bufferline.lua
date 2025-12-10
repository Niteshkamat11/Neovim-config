-- lua/nitesh/bufferline.lua

require("bufferline").setup{
    options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,       -- add this line
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
        separator_style = "slant",
    }
}

