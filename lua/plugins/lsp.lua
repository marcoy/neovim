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
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
      local lsp = require("lsp-zero").preset("recommended")

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, prefix = "<space>" }
        local wk = require("which-key")

        wk.register({
          f = { function() vim.lsp.buf.format { async = true } end, "Format file" },
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

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.skip_server_setup({'hls'})

      lsp.setup()
    end,
  },
}

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
