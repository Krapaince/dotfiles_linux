-- {{@@ header() @@}}

return function()
  local map = require("utils").map

  vim.g.nvim_tree_special_files = {}

  vim.g.nvim_tree_highlight_opened_files = 3
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_group_empty = 0

  vim.g.nvim_tree_ignore = {
    '.git',
    '*.o'
  }

  require'nvim-tree'.setup {
      open_on_tab = true,
      diagnostics = {
          enable = true
      },
      view = {
          side = 'left',
          auto_resize = false,
      }
  }

  map('n', '<C-b>', ':NvimTreeToggle<CR>')
end
