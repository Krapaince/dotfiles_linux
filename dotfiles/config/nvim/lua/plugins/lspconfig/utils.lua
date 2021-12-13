-- {{@@ header() @@}}

return {
  buf_set_keymap = function(bufnr, ...)
    require('utils').buf_map(bufnr, ...)
  end,
  on_attach = function(client, bufnr)
    local buf_set_keymap = require('plugins.lspconfig.utils').buf_set_keymap

    buf_set_keymap(bufnr, 'n', 'gd',        '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_set_keymap(bufnr, 'n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_set_keymap(bufnr, 'n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_set_keymap(bufnr, 'n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_set_keymap(bufnr, 'n', 'gt',        '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_set_keymap(bufnr, 'n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_set_keymap(bufnr, 'n', 'g0',        '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    buf_set_keymap(bufnr, 'n', 'gW',        '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    buf_set_keymap(bufnr, 'n', '<C-c>',     '<cmd>CodeActionMenu<CR>')
    buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

    if client.resolved_capabilities.document_formatting then
      buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'
    end

    require('folding').on_attach()
  end,
}
