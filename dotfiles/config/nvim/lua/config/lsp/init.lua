-- {{@@ header() @@}}

return function()
  local lsp = require('lspconfig')

  local utils = require('utils')

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

    buf_set_keymap('n', 'gd',        '<cmd>lua vim.lsp.buf.declaration()<CR>')
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

    if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
      vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'
    end

    require('folding').on_attach()
  end

  local servers = {
    require('config.lsp.clangd'),
    require('config.lsp.rust-analyzer'),
    require('config.lsp.sumneko_lua'),
    require('config.lsp.texlab'),

    -- Require default config:
    require'lspconfig'.bashls.setup{},
    require'lspconfig'.cssls.setup{},
    require'lspconfig'.dockerls.setup{},
    require'lspconfig'.html.setup{},
    require'lspconfig'.jsonls.setup{},
    require'lspconfig'.yamlls.setup{},
  }

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = ''
      },
    }
  )

  vim.fn.sign_define('LspDiagnosticsSignError',
    { text = '', texthl = 'LspDiagnosticsSignError' })
  vim.fn.sign_define('LspDiagnosticsSignWarning',
    { text = '', texthl = 'LspDiagnosticsSignWarning' })
  vim.fn.sign_define('LspDiagnosticsSignInformation',
    { text = '', texthl = 'LspDiagnosticsSignInformation' })
  vim.fn.sign_define('LspDiagnosticsSignHint',
    { text = '', texthl = 'LspDiagnosticsSignHint' })

  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler

  for _, server in ipairs(servers) do
    lsp[server.name].setup {
      on_attach = on_attach,
      cmd = server.cmd,
      settings = server.settings,
      capabilities = capabilities
    }
  end
end
