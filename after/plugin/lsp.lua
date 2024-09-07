local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local wk = require("which-key")
local luasnip = require("luasnip")

cmp.setup({
  formatting = cmp_format,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'path' },
    {
      name = "latex_symbols",
      option = { strategy = 0, },
    },
    { name = 'buffer',  keyword_length = 2 },
    { name = 'luasnip', keyword_length = 2 },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),

    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),

    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
})

local hls_augroup = vim.api.nvim_create_augroup('haskell-lsp', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  group = hls_augroup,
  pattern = {'haskell'},
  callback = function()
    ---
    -- Suggested keymaps from the quick setup section:
    -- https://github.com/mrcjkb/haskell-tools.nvim#quick-setup
    ---
    local ht = require('haskell-tools')
    local bufnr = vim.api.nvim_get_current_buf()
    local def_opts = { noremap = true, silent = true, }
    local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, prefix = "<space>" })

    -- wk.register({
    --   h = {
    --     s = { ht.hoogle.hoogle_signature, "Hoogle signature search" },
    --   },
    --   e = {
    --     a = { ht.lsp.buf_eval_all, "Haskell evaluate all" },
    --   },
    --   r = {
    --     r = { ht.repl.toggle, "Toggle GHCi REPL for package" },
    --     f = { function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end, "Toggle GHCi REPL for current buffer" },
    --     q = { ht.repl.quit, "Close GHCi REPL" },
    --   },
    -- }, opts)

    require('telescope').load_extension('ht')
  end
})
