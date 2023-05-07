return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  {
    "nvim-telescope/telescope.nvim",
     dependencies = { 'nvim-lua/plenary.nvim' },
     tag = '0.1.1',
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
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  { "windwp/nvim-autopairs", config = true, },
  {
    'akinsho/toggleterm.nvim', version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      shading_factor = "-25",
    }
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
  { "catppuccin/nvim",
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
  { "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = true,
    priority = 1000
  },
  { "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = true,
    priority = 1000
  },
}

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
