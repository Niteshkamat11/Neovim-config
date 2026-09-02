require("telescope").setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.65,
            },
            width = 0.95,
            height = 0.85,
        },
    },
    extensions = { fzf = {} }
})
require("telescope").load_extension("fzf")
