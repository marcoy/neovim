return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build= ":TSUpdate",
    config = function(_, opts)
      -- pcall(require("nvim-treesitter.install").update { with_sync = true })
      require("nvim-treesitter.configs").setup(opts)

      -- https://github.com/nvim-neorg/tree-sitter-norg/issues/45#issuecomment-1380721580
      -- MacOS. Need gcc from Homebrew
      -- require("nvim-treesitter.install").compilers = { "gcc-12" }
    end,
    opts = {
      ensure_installed = {
        "lua", "vim", "help", "r"
      },
      auto_install = true,
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}
