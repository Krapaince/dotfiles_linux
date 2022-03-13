-- {{@@ header() @@}}

return function()
  local map = require('utils').map

  vim.g.nvim_tree_special_files= {}
  vim.g.nvim_tree_icons = {
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed =  "➜",
      untracked = "*",
      deleted = "",
      ignored = "",
    }
  }

  require('nvim-tree').setup {
    open_on_tab = true,
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      preserve_window_proportions = false,
      mappings = {
        custom_only = true,
        list = {
          { key='o', action='edit' },
          { key='P', action='parent_node' },
          { key='<Space>', action='close_node' },
          { key='<Tab>', action='preview' },
          { key='I', action='toggle_ignored' },
          { key='H', action='toggle_dotfiles' },
          { key='R', action='refresh' },
          { key='a', action='create' },
          { key='d', action='remove' },
          { key='r', action='rename' },
          { key='<C-r>', action='full_rename' },
          { key='x', action='cut' },
          { key='c', action='copy' },
          { key='p', action='paste' },
          { key='y', action='copy_name' },
          { key='Y', action='copy_path' },
          { key='gy', action='copy_absolute_path' },
          { key='-', action='dir_up' },
          { key='s', action='system_open' },
          { key='q', action='quit' },
          { key='W', action='collapse_all' },
          { key="K", action='toggle_file_info' },
        }
      },
    },
  }

  map('n', '<C-b>', ':NvimTreeToggle<CR>')
end
