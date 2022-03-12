-- {{@@ header() @@}}
local null_ls = require("null-ls")
local utils = require('plugins.lspconfig.utils')

require("null-ls").setup({
  sources = {
    function()
        local nl_utils = require("null-ls.utils").make_conditional_utils()
        return nl_utils.root_has_file(".prettierrc.json") and
          null_ls.builtins.formatting.prettierd.with{ filetypes = {"html", "javascript", "typescript" }} or
          null_ls.builtins.formatting.eslint_d.with({ filetypes = {"javascript", "typescript"}})
    end,
  },
  on_attach = function (client, bufnr)
    local buf_set_keymap = require('plugins.lspconfig.utils').buf_set_keymap

    if client.supports_method("textDocument/formatting") then
      buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'
    end
  end
})

return {
  name = 'tsserver',
  custom_on_attach = true,
  on_attach = function (client, bufnr)
    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup({})

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    utils.set_ls_keymaps(client, bufnr)
  end
}
