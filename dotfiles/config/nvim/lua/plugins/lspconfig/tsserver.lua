-- {{@@ header() @@}}
local utils = require('plugins.lspconfig.utils')

return {
  name = 'tsserver',
  custom_on_attach = true,
  on_attach = function(client, bufnr)
    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup({})
    utils.set_ls_keymaps(client, bufnr, false)
    utils.buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>TSLspOrganize<CR>')
  end,
}
