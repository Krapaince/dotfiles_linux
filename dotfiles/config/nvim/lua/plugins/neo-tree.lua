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
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        with_markers = false,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        default = "*",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = false,
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "✚",
          deleted   = "✖",
          modified  = "",
          renamed   = "",
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
    },

    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {},
        never_show = {},
      },
      follow_current_file = false,
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
          ["m"] = "move",
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
