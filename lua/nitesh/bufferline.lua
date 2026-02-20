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

    left_mouse_command = function(bufnum)
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })
        if buftype ~= "terminal" and buftype ~= "nofile" then
          vim.api.nvim_set_current_win(win)
          vim.api.nvim_set_current_buf(bufnum)
          return
        end
      end
      vim.api.nvim_set_current_buf(bufnum)
    end,
  },
}

