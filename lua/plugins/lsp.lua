return {
  {
    "folke/trouble.nvim",
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    cmd = "TroubleToggle",
  },
  {
    "glepnir/lspsaga.nvim",
    config = true,
    event = "LspAttach",
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'saadparwaiz1/cmp_luasnip',
      'kdheepak/cmp-latex-symbols',
    }
  },
  {
    'simrat39/symbols-outline.nvim',
    opts = {
      highlight_hovered_item = false,
    },
    cmd = {
      'SymbolsOutline',
      'SymbolsOutlineOpen',
      'SymbolsOutlineClose',
    },
  },
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  },
  {
    'williamboman/mason.nvim',
    config = true,
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lsp_zero = require("lsp-zero")
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup({
        handlers = {
          lsp_zero.default_setup,
          hls = lsp_zero.noop,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })
    end,
  },
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require("iron.core")
      -- local wk = require("which-key")
      -- local bufnr = vim.api.nvim_get_current_buf()

      iron.setup {
        config = {
          repl_definition = {
            sh = {
              command = {"zsh"}
            },
            haskell = {
              command = function(meta)
                local file = vim.api.nvim_buf_get_name(meta.current_bufnr)
                -- call `require` in case iron is set up before haskell-tools
                return require('haskell-tools').repl.mk_repl_cmd(file)
              end,
            },
          },
          repl_open_cmd = require('iron.view').bottom(40),
        },
      }

      -- local opts = { buffer = bufnr, prefix = "<space>" }
      -- wk.register({
      --   i = {
      --   }
      -- }, opts)
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required

      -- Autocompletion
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
      local lsp_zero = require("lsp-zero") -- .preset("recommended")

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
        local opts = { buffer = bufnr, prefix = "<space>" }
        local wk = require("which-key")

        wk.register({
          f = { function() vim.lsp.buf.format { async = true } end, "Format file" },
          -- g = {
          --   i = { vim.lsp.buf.implementation, "List all implementations"},
          -- },
          t = {
            d = { "<cmd>Telescope lsp_definitions<cr>", "Telescope LSP definitions" },
            r = { "<cmd>Telescope lsp_references<cr>", "Telescope LSP references" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Telescope LSP document symbols" },
            S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope LSP workspace symbols" },
          },
          r = {
            n = { vim.lsp.buf.rename, "Rename" },
          },
          c = {
            l = { vim.lsp.codelens.run, "Code lens" },
            a = { vim.lsp.buf.code_action, "Code actions" },
          },
          w = {
            a = { vim.lsp.buf.add_workspace_folder, "Workspace add folder" },
            r = { vim.lsp.buf.remove_workspace_folder, "Workspace remove folder" },
            l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "Workspace list folders" },
          },
        }, opts)
      end)

      vim.g.haskell_tools = {
        hls = {
          capabilities = lsp_zero.get_capabilities(),
          default_settings = {
            haskell = { -- haskell-language-server options
              formattingProvider = "stylish-haskell",
            }
          },
        },
        -- tools = { -- haskell-tools options
        --   log = {
        --     level = vim.log.levels.DEBUG,
        --   },
        -- },
      }
    end,
  },
}

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
