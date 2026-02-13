-- lua/nitesh/bufferline.lua
require("bufferline").setup{
    options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
        separator_style = "slant",
        
        -- Add this to handle clicks properly
        close_command = function(bufnum)
            require("bufdelete").bufdelete(bufnum, true)
        end,
        
        -- This is the key fix - ensure clicks go to the right window
        left_mouse_command = function(bufnum)
            -- Find the first non-terminal, non-special window
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
                if buftype ~= 'terminal' and buftype ~= 'nofile' then
                    vim.api.nvim_set_current_win(win)
                    vim.api.nvim_set_current_buf(bufnum)
                    return
                end
            end
            -- If no suitable window found, just switch buffer
            vim.api.nvim_set_current_buf(bufnum)
        end,
    }
}

