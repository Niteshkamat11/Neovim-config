-- Gruvbox material settings (must be before colorscheme loads)
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_palette = "material"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_disable_italic_comment = 1


vim.o.background = "dark"
-- Load saved colorscheme or use default
local settings_file = vim.fn.stdpath("config") .. "/lua/nitesh/settings/colorscheme.txt"

-- Try to read saved colorscheme
local saved_colorscheme = nil
local file = io.open(settings_file, "r")
if file then
  saved_colorscheme = file:read("*line")
  file:close()
end

-- Use saved colorscheme or default to tokyonight
local colorscheme = saved_colorscheme or "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Save colorscheme selection when changed
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local current = vim.g.colors_name
    local f = io.open(settings_file, "w")
    if f then
      f:write(current)
      f:close()
    end
  end,
})
