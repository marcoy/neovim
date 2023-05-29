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
    'mrcjkb/haskell-tools.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    ft = "haskell",
    -- branch = '1.x.x', -- recommended
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
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
      require("flit").setup({
        labeled_modes = "nvo",
      })
    end,
    dependencies = {
      "ggandor/flit.nvim",
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
    'tridactyl/vim-tridactyl',
    lazy = true,
    ft = "tridactyl",
  },
  "chrisbra/unicode.vim",

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
