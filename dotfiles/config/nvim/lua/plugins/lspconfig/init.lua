-- {{@@ header() @@}}
return function()
  local lsp = require('lspconfig')
  local utils = require('plugins.lspconfig.utils')

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local servers = {
    require('plugins.lspconfig.clangd'),
    require('plugins.lspconfig.rust-analyzer'),
    require('plugins.lspconfig.sumneko_lua'),
    require('plugins.lspconfig.texlab'),
    require('plugins.lspconfig.tsserver'),

    -- Require default config:
    { name = 'bashls' },
    { name = 'cssls' },
    { name = 'dockerls' },
    { name = 'html' },
    { name = 'jsonls' },
    { name = 'yamlls' },
    { name = 'pyright' },
    { name = 'tailwindcss' },
  }

  require('plugins.lspconfig.volar')

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
    local on_attach_fn = utils.set_ls_keymaps
    if server.custom_on_attach then
      on_attach_fn = server.on_attach
    end

    lsp[server.name].setup {
      on_attach = on_attach_fn,
      cmd = server.cmd,
      settings = server.settings,
      capabilities = capabilities
    }
  end
end
