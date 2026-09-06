local Terminal = require("toggleterm.terminal").Terminal

-- Float Terminal (centered)
local float_term = Terminal:new({
    direction = "float",
    float_opts = {
        border = "rounded",
        winblend = 18,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    start_in_insert = true,
    close_on_exit = true,
    persist_size = true,
})

vim.keymap.set("n", "<leader>t", function()
    float_term:toggle()
end, { noremap = true, silent = true,desc = "Toggle float terminal" })

-- Dynamic right-side vertical-like terminal
local vertical_term = Terminal:new({
    direction = "float",
    float_opts = {
        border = "rounded",
        width = 80,
        height = vim.o.lines - 4,
        row = 0,
        col = vim.o.columns - 83,
        winblend = 20,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    start_in_insert = true,
    close_on_exit = true,
    persist_size = false,
})

vim.keymap.set("n", "<leader>v", function()
    -- Recalculate position and size dynamically
    local width = 80
    local height = vim.o.lines - 4
    local col = vim.o.columns - (width + 3)
    
    vertical_term.float_opts.width = width
    vertical_term.float_opts.height = height
    vertical_term.float_opts.col = col
    vertical_term.float_opts.row = 0
    
    vertical_term:toggle()
end, { noremap = true, silent = true , desc = "Toggle vertical terminal"})

-- Also map <leader>v in terminal mode to close the terminal
vim.keymap.set("t", "<leader>v", function()
    vertical_term:toggle()
end, { noremap = true, silent = true , desc = "Close vertical terminal when in terminal"})
