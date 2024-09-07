local tele = require("telescope.builtin")
local tele_themes = require("telescope.themes")
local wk = require("which-key")

wk.add({
  { "<leader>f", group = "file" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", mode = "n" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers", mode = "n" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags", mode = "n" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File", mode = "n" },
  { "<leader>ft", "<cmd>Telescope file_browser<cr>", desc = "File Tree", mode = "n" },
})
