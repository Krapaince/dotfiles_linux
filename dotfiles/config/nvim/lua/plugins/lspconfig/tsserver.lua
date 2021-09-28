local nvim_lsp = require("lspconfig")

-- enable null-ls integration (optional)
require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}

nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            import_all_priorities = {
                buffers = 4,            -- loaded buffer names
                buffer_content = 3,     -- loaded buffer content
                local_files = 2,        -- git files or files with relative path markers
                same_file = 1,          -- add to existing import statement
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint",
            eslint_enable_diagnostics = false,
            eslint_opts = {},

            -- formatting
            enable_formatting = true,
            formatter = "prettier",
            formatter_opts = {},

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

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
        buf_set_keymap('n', '<C-c>',     '<cmd>lua vim.lsp.buf.code_action()<CR>')
        buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
        buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
        vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    end
}
