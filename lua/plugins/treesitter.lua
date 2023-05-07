return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function(_, opts)
      -- pcall(require("nvim-treesitter.install").update { with_sync = true })
      require("nvim-treesitter.configs").setup(opts)

      -- https://github.com/nvim-neorg/tree-sitter-norg/issues/45#issuecomment-1380721580
      -- MacOS. Need gcc from Homebrew
      -- require("nvim-treesitter.install").compilers = { "gcc-12" }
    end,
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "help", "markdown", "markdown_inline", "query"
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
    lazy = true,
    config = function()
      require "nvim-treesitter.configs".setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
    end,
    cmd = "TSPlaygroundToggle",
  },
}
