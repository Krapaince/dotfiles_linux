-- {{@@ header() @@}}
local null_ls = require('null-ls')
local utils = require('plugins.lspconfig.utils')

require('null-ls').setup({
  sources = {
    function()
      local nl_utils = require('null-ls.utils').make_conditional_utils()
      return nl_utils.root_has_file('.prettierrc.json')
          and null_ls.builtins.formatting.prettierd.with({ filetypes = { 'html', 'javascript', 'typescript' } })
        or null_ls.builtins.formatting.eslint_d.with({ filetypes = { 'javascript', 'typescript' } })
    end,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    utils.set_ls_formatting_keymaps(client, bufnr)
  end,
})
