-- {{@@ header() @@}}

local M = {}

M.buf_set_keymap = function (bufnr, ...)
    require('utils').buf_map(bufnr, ...)
  end

M.set_ls_formatting_keymaps = function (client, bufnr)
    if client.resolved_capabilities.document_formatting then
      M.buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'
    end
  end

M.set_ls_keymaps = function (client, bufnr, formatting)
    M.buf_set_keymap(bufnr, 'n', 'gd',        '<cmd>lua vim.lsp.buf.declaration()<CR>')
    M.buf_set_keymap(bufnr, 'n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>')
    M.buf_set_keymap(bufnr, 'n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>')
    M.buf_set_keymap(bufnr, 'n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    M.buf_set_keymap(bufnr, 'n', 'gt',        '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    M.buf_set_keymap(bufnr, 'n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>')
    M.buf_set_keymap(bufnr, 'n', 'g0',        '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    M.buf_set_keymap(bufnr, 'n', 'gW',        '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    M.buf_set_keymap(bufnr, 'n', '<C-c>',     '<cmd>CodeActionMenu<CR>')
    M.buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    M.buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

    if formatting then
      M.set_ls_formatting_keymaps(client, bufnr)
    else
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end

return M
