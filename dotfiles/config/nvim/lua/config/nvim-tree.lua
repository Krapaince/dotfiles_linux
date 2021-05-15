-- {{@@ header() @@}}

return function()
  local map = require("utils").map

  map('n', '<C-b>', ':NvimTreeToggle<CR>')

  vim.g.nvim_tree_ignore = {
    '.git',
    '*.o'
  }
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_lsp_diagnostics = 1
  vim.g.nvim_tree_tab_open = 1
end
