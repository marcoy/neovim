return {
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   opts = {
  --     load = {
  --       ["core.defaults"] = {}, -- Loads default behaviour
  --       ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
  --       ["core.norg.dirman"] = { -- Manages Neorg workspaces
  --         config = {
  --           workspaces = {
  --             notes = "~/Documents/Neorg/Notes",
  --           },
  --           default_workspace = "notes",
  --         },
  --       },
  --       ["core.integrations.treesitter"] = {},
  --       ["core.norg.completion"] = {
  --         config = {
  --           engine = "nvim-cmp"
  --         },
  --       },
  --     },
  --   },
  --   dependencies = { { "nvim-lua/plenary.nvim" } },
  -- }
  -- "renerocksai/calendar-vim",
  -- {
  --   "renerocksai/telekasten.nvim",
  --   dependencies = {"nvim-telescope/telescope.nvim"},
  --   opts = function()
  --     local home = "/Users/marcoy/Documents/Zettel"
  --
  --     return {
  --       home = home,
  --       follow_creates_nonexisting = true,
  --       dailies_create_nonexisting = true,
  --       weeklies_create_nonexisting = true,
  --       template_new_note = home .. "/" .. "templates/new_note.md",
  --       template_new_daily = home .. "/" .. "templates/daily.md",
  --       template_new_weekly = home .. "/" .. "/templates/weekly.md",
  --     }
  --   end,
  --   keys = {
  --     {"<leader>z",  "<cmd>Telekasten panel<CR>", desc = "Telekasten panel"},
  --     {"<leader>z/", "<cmd>Telekasten search_notes<CR>", desc = "Telekasten search notes"},
  --     {"<leader>zC", "<cmd>CalendarT<CR>", desc = "Telekasten calendar"},
  --     {"<leader>zF", "<cmd>Telekasten find_friends<CR>", desc = "Telekasten find friends"},
  --     {"<leader>zT", "<cmd>Telekasten goto_today<CR>", desc = "Telekasten today's note"},
  --     {"<leader>zW", "<cmd>Telekasten goto_thisweek<CR>", desc = "Telekasten this week"},
  --     {"<leader>zb", "<cmd>Telekasten show_backlinks<CR>", desc = "Telekasten show back links"},
  --     {"<leader>zc", "<cmd>Telekasten show_calendar<CR>", desc = "Telekasten show calendar"},
  --     {"<leader>zf", "<cmd>Telekasten find_notes<CR>", desc = "Telekasten find notes"},
  --     {"<leader>zn", "<cmd>Telekasten new_note<CR>", desc = "Telekasten new note"},
  --     {"<leader>zt", "<cmd>Telekasten show_tags<CR>", desc = "Telekasten show tags"},
  --     {"<leader>zz", "<cmd>Telekasten follow_link<CR>", desc = "Telekasten follow link"},
  --     {"<leader><leader>[", function() require('telekasten').insert_link({ i=true }) end, desc = "Telekasten insert link", mode = "i"},
  --     {"<leader><leader>zt", function() require('telekasten').toggle_todo({ i=true }) end, desc = "Telekasten toggle todo", mode = "i"},
  --   },
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   config = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = "markdown",
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Knowledge",
          path = "~/Documents/Knowledge",
        },
      },
    }
  },
}
