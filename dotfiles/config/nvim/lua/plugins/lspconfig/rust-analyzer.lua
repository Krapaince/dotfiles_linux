-- {{@@ header() @@}}

local root_pattern = require'lspconfig/util'.root_pattern

return {
  name = 'rust_analyzer',
  filetypes = { "rust" },
  root_dir = root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        autoreload = true
      },
      diagnostics = {
        enable = true,
        disabled = {"unresolved-proc-macro"},
        enableExperimental = true,
      },
    }
  }
}
