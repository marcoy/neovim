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
    name = "leap",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    event = "VeryLazy",
    config = function()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      local positions = require("hop.hint").HintPosition
      local wk = require("which-key")

      hop.setup()

      wk.register({
        f = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, "Hop f" },
        F = { function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, "Hop F" },
        t = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, "Hop t" },
        T = { function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 }) end, "Hop T" },
        [",,j"] = { function() hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR }) end, "Hop j" },
        [",,k"] = { function() hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR }) end, "Hop k" },
        [",,w"] = { function() hop.hint_words({ direction = directions.AFTER_CURSOR }) end, "Hop w" },
        [",,e"] = { function() hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END }) end, "Hop e" },
        [",,b"] = { function() hop.hint_words({ direction = directions.BEFORE_CURSOR }) end, "Hop b" },
        [",,/"] = { function() hop.hint_patterns({ direction = nil, multi_windows = true }) end, "Hop /" },
      }, { nowait = true, noremap = false })
    end,
    dependencies = {
      "folke/which-key.nvim",
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
