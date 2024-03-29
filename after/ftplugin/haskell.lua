-- local telescope = require('telescope')
-- local ht = require('haskell-tools')
-- local bufnr = vim.api.nvim_get_current_buf()
-- local def_opts = { noremap = true, silent = true, }
-- local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, prefix = "<space>" })
-- local wk = require("which-key")
-- local hls_lsp = require('lsp-zero').build_options('hls', {})

-- ht.start_or_attach {
--   hls = {
--     capabilities = hls_lsp.capabilities,
--     default_settings = {
--       haskell = { -- haskell-language-server options
--         formattingProvider = "stylish-haskell",
--       }
--     },
--     on_attach = function(client, bufnr)
--       local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, prefix = "<space>" })
--       local wk = require("which-key")
--
--       wk.register({
--         h = {
--           s = { ht.hoogle.hoogle_signature, "Hoogle signature search" },
--         },
--         e = {
--           a = { ht.lsp.buf_eval_all, "Haskell evaluate all" },
--         },
--         r = {
--           r = { ht.repl.toggle, "Toggle GHCi REPL for package" },
--           f = { function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end, "Toggle GHCi REPL for current buffer" },
--           q = { ht.repl.quit, "Close GHCi REPL" },
--         },
--       }, opts)
--
--       require('telescope').load_extension('ht')
--     end,
--   },
-- }
--
-- Detect nvim-dap launch configurations
-- (requires nvim-dap and haskell-debug-adapter)
-- ht.dap.discover_configurations(bufnr)
