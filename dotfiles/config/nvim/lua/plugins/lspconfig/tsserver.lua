-- {{@@ header() @@}}
local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")

nvim_lsp.tsserver.setup ({
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)


        local utils = require('utils')
        local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

        buf_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>')
        buf_set_keymap('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>')
        buf_set_keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>')
        buf_set_keymap('n', 'gt',        '<cmd>lua vim.lsp.buf.type_definition()<CR>')
        buf_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>')
        buf_set_keymap('n', 'g0',        '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
        buf_set_keymap('n', 'gW',        '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
        buf_set_keymap('n', '<C-c>',     '<cmd>CodeActionMenu<CR>')
        buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
        buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
        vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    end
})

-- enable null-ls integration (optional)
null_ls.config({
  debug = true,
  default_timeout = 5000,
  sources = {
    require("null-ls.helpers").conditional(function(utils)
      return utils.root_has_file(".prettierrc.json") and
      null_ls.builtins.formatting.prettier.with({ filetypes = {"html", "typescript" }}) or
      null_ls.builtins.formatting.eslint_d.with({ filetypes = {"javascript", "typescript"}})
    end),
  }
})
require("lspconfig")["null-ls"].setup({})
