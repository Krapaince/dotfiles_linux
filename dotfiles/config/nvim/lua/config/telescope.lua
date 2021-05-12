-- {{@@ header() @@}}

return function ()
  local map = require("utils").map
  local telescope = require('telescope')

  telescope.load_extension('fzy_native')

  map('n', '<C-p>', ':Telescope find_files<CR>')
  map('n', '<C-f>', ':Telescope live_grep<CR>')
  map('n', '<C-s>', ':Telescope lsp_references<CR>')
  map('n', '<C-d>', ':Telescope lsp_document_diagnostics<CR>')
end
