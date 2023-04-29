-- {{@@ header() @@}}

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = '',
        severity_sort = true,
        source = 'if_many',
      },
      spacing = 1,
    },
    servers = {
      'bashls',
      'clangd',
      'cssls',
      'dockerls',
      'elixirls',
      'html',
      'jsonls',
      'lua_ls',
      'null-ls',
      'pyright',
      'rust-analyzer',
      'texlab',
      'tsserver',
      'yamlls',
    },
  },
  config = function(_, opts)
    -- diagnostics
    local diag_icons = require('{{@@ user @@}}.config').icons.diagnostics
    for name, icon in pairs(diag_icons) do
      name = 'DiagnosticSign' .. name
      vim.fn.sign_define(name, { text = icon, texthl = name })
    end

    vim.lsp.handlers['textDocument/publishDiagnostics'] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, opts.diagnostics)

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local on_attach = function(client, buf)
      require('{{@@ user @@}}.plugins.lsp.format').on_attach(client, buf)
      require('{{@@ user @@}}.plugins.lsp.keymaps').on_attach(client, buf)

      if client.supports_method('textDocument/documentSymbol') then
        require('nvim-navic').attach(client, buf)
      end
    end

    for _, server_name in ipairs(opts.servers) do
      local success, server = pcall(require, '{{@@ user @@}}.plugins.lsp.servers.' .. server_name)

      if success then
        server.setup(on_attach, capabilities)
      else
        -- Load default lsp config
        require('lspconfig')[server_name].setup({ on_attach, capabilities })
      end
    end
  end,
  dependencies = {
    { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
    'jose-elias-alvarez/null-ls.nvim',
    'jose-elias-alvarez/typescript.nvim',
    'simrat39/rust-tools.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
}
