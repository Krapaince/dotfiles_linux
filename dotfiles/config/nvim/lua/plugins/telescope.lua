-- {{@@ header() @@}}

return function()
  local map = require('utils').map
  local telescope = require('telescope')
  local actions = require('telescope.actions')

  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<esc>'] = actions.close,
        },
      },
    },
    extensions = {
      fzf = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },
    },
    file_ignore_patterns = {
      'nodes_modules/.*',
      '.git/.*',
      'target/.*',
    },
  })

  telescope.load_extension('fzy_native')

  map('n', '<C-p>', ':Telescope find_files<CR>')
  map('n', '/', ':Telescope live_grep<CR>')
  map('n', '<C-s>', ':Telescope lsp_document_symbols<CR>')
  map('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>')
end
