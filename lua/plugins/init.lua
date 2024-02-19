return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = '0.1.x',
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
      })
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
    event = "VeryLazy",
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      jump = {
        autojump = true,
      }
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
  },
  { "windwp/nvim-autopairs", config = true, },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      shading_factor = "-25",
      insert_mappings = true,
      terminal_mappings = true,
    },
  },
  {
    "tridactyl/vim-tridactyl",
    lazy = true,
    ft = "tridactyl",
  },
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "chrisbra/unicode.vim",
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = {"jk", "jj"}
    },
  },

  --
  -- Colour Schemes
  --
  "folke/tokyonight.nvim",
  "tiagovla/tokyodark.nvim",
  {
    'navarasu/onedark.nvim',
    opts = {
      style = "darker"
    },
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    opts = {
      style = "dark",
      terminal = vim.fn.has("gui_running") == 1,
    }
  },
  {
    "jacoborus/tender.vim",
    lazy = true,
    priority = 1000,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = true,
    priority = 1000
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = true,
    priority = 1000
  },
}

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
