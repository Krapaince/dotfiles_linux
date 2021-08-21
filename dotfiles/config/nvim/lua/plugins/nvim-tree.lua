-- {{@@ header() @@}}

return function()
  local map = require("utils").map

  map('n', '<C-b>', ':NvimTreeToggle<CR>')

  local callbacks = require'nvim-tree.config'.nvim_tree_callback
  vim.g.nvim_tree_bindings = {
      { key = "p", cb = callbacks("parent_node") },
  }

  vim.g.nvim_tree_ignore = {
    '.git',
    '*.o'
  }
  vim.g.nvim_tree_special_files = {}

  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_highlight_opened_files = 3
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_lsp_diagnostics = 1
  vim.g.nvim_tree_tab_open = 1
  vim.g.nvim_tree_auto_resize = 0
  vim.g.nvim_tree_group_empty = 0
end
