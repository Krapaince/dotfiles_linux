-- {{@@ header() @@}}

local M = {}

M.setup = function(on_attach, capabilities)
  require('rust-tools').setup({
    server = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ['rust-analyzer'] = {
          checkOnSave = {
            command = 'clippy',
          },
          cargo = {
            autoreload = true,
          },
          diagnostics = {
            enable = true,
            disabled = {},
            enableExperimental = true,
          },
        },
      },
    },
  })
end

return M
