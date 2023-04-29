-- {{@@ header() @@}}

local M = {}

function M.setup(on_attach, capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require('lspconfig').html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    provideFormatter = false,
  })
end

return M
