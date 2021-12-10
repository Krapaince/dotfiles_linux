-- {{@@ header() @@}}

return function()
  local lsp = require('lspconfig')

  local utils = require('utils')

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
    buf_set_keymap('n', '<C-c>',     '<cmd>CodeActionMenu<CR>')
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

    if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
      vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'
    end

    require('folding').on_attach()
  end

  local servers = {
    require('plugins.lspconfig.clangd'),
    require('plugins.lspconfig.rust-analyzer'),
    require('plugins.lspconfig.sumneko_lua'),
    require('plugins.lspconfig.texlab'),
    require('plugins.lspconfig.volar'),
    require('plugins.lspconfig.eslint'),

    -- Require default config:
    { name = 'bashls' },
    { name = 'cssls' },
    { name = 'dockerls' },
    { name = 'html' },
    { name = 'jsonls' },
    { name = 'yamlls' },
    { name = 'jedi_language_server'},
  }


  require('plugins.lspconfig.tsserver')

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = ''
      },
    }
  )

    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

  for _, server in ipairs(servers) do
    lsp[server.name].setup {
      on_attach = on_attach,
      cmd = server.cmd,
      settings = server.settings,
      capabilities = capabilities
    }
  end
end
