local tele = require("telescope.builtin")
local tele_themes = require("telescope.themes")
local wk = require("which-key")

wk.register({
  f = {
    name = "file",
    b = { tele.buffers, "Find Buffer" },
    f = { tele.find_files, "Find File" },
    h = { tele.help_tags, "Help Tags" },
    r = { tele.oldfiles, "Recent File" },
    s = { tele.live_grep, "Live Grep" },
    t = { "<cmd>Telescope file_browser<cr>", "File Tree" },
  },
  ["/"] = { function() tele.current_buffer_fuzzy_find(tele_themes.get_dropdown { winblend = 10, previewer = false, }) end,
        "Fuzzy search in current buffer" },
}, {
  prefix = "<leader>"
})
