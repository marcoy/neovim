local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local nvim_lsp = require("lspconfig")
local nvim_lsp_configs = require("lspconfig.configs")

cmp.setup({
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

vim.tbl_deep_extend('keep', nvim_lsp, {
    ahk2 = {
        cmd = { 'node', 'C:\\Users\\marco\\Projects\\vscode-autohotkey2-lsp\\server\\dist\\server.js', '--stdio' },
        filetypes = 'autohotkey',
        name = 'ahk2',
    }
})


--
-- AHK2
--
-- https://github.com/thqby/vscode-autohotkey2-lsp/issues/207#issuecomment-1304783330
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local function custom_attach(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = { "double" },
    })
end

local ahk2_configs = {
    autostart = true,
    cmd = {
        "node",
        "C:/Users/marco/Projects/vscode-autohotkey2-lsp/server/dist/server.js",
        "--stdio"
    },
    filetypes = { "ahk", "autohotkey" },
    init_options = {
        locale = "en-us",
        AutoLibInclude = "Disabled",
        CommentTags = "^;;\\s*(?<tag>.+)",
        CompleteFunctionParens = false,
        Diagnostics = {
            ClassStaticMemberCheck = true,
            ParamsCheck = true
        },
        -- ActionWhenV1IsDetected = "Continue",
        DisableV1Script = true,
        FormatOptions = {
            break_chained_methods = false,
            ignore_comment = false,
            indent_string = "\t",
            keep_array_indentation = true,
            max_preserve_newlines = 2,
            brace_style = "One True Brace",
            preserve_newlines = true,
            space_after_double_colon = true,
            space_before_conditional = true,
            space_in_empty_paren = false,
            space_in_other = true,
            space_in_paren = false,
            wrap_line_length = 0
        },
        InterpreterPath = "C:/Users/marco/scoop/shims/autohotkey.exe",
        WorkingDirs = {},
        SymbolFoldingFromOpenBrace = false
    },
    single_file_support = true,
    flags = { debounce_text_changes = 500 },
    capabilities = capabilities,
    on_attach = custom_attach,
}

nvim_lsp_configs["ahk2"] = { default_config = ahk2_configs }
nvim_lsp.ahk2.setup({})
