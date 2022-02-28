-- {{@@ header() @@}}

return function()
  local map = require("utils").map

  -- See ":help neo-tree-highlights" for a list of available highlight groups
  vim.cmd([[
    hi link NeoTreeDirectoryName Directory
    hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
  ]])

  vim.fn.sign_define("LspDiagnosticsSignError", {text = " ", texthl = "DiagnosticSignError"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = " ", texthl = "DiagnosticSignWarn"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = " ", texthl = "DiagnosticSignInfo"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", texthl = "DiagnosticSignHint"})

  require("neo-tree").setup({
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filters = {
        show_hidden = false,
        respect_gitignore = true,
      },
      follow_current_file = true,
      use_libuv_file_watcher = true,
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["C"] = "none",
          ["P"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["I"] = "toggle_gitignore",
          ["R"] = "refresh",
          ["/"] = "filter_as_you_type",
          --["/"] = "none" -- Assigning a key to "none" will remove the default mapping
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["c"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
        }
      }
    },
    buffers = {
      show_unloaded = true,
      window = {
        position = "left",
        mappings = {
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["P"] = "navigate_up",
          ["."] = "set_root",
          ["R"] = "refresh",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["c"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["bd"] = "buffer_delete",
        }
      },
    },
  })

  map('n', '<C-b>', ':NeoTreeRevealToggle<CR>')
end
