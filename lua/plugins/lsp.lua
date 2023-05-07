return {
  {
    "folke/trouble.nvim",
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    config = true,
    cmd = "Lspsaga",
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-nvim-lsp-document-symbol'},
    },
    config = function()
      local lsp = require("lsp-zero").preset("recommended")
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
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

      cmp.setup({
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = true}),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })

      lsp.setup()
    end,
  },
}

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
