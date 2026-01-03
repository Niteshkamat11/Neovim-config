local wk = require("which-key")
wk.add({
  { "<leader>c",  group = "Code/Colorscheme" },
  { "<leader>cs", desc = "Select colorscheme" },
  { "<leader>G",  group = "Git" },
  { "<leader>Gb", desc = "Blame line" },
  { "<leader>Gp", desc = "Preview hunk" },
  { "<leader>Gr", desc = "Reset hunk" },
  { "<leader>Gs", desc = "Stage hunk" },
  { "<leader>Gu", desc = "Undo stage hunk" },
})
